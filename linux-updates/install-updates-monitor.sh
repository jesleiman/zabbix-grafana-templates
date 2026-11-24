#!/usr/bin/env bash
# ==============================================================================
# Instalador Automático de Monitoreo de Actualizaciones Linux para Zabbix
# Autor: jesleiman (https://github.com)
# Soporta: RHEL/Rocky/AlmaLinux/CentOS/Fedora, Ubuntu, Debian y SUSE/openSUSE
# ==============================================================================

set -e

# Verificar ejecución como root
if [[ $EUID -ne 0 ]]; then
   echo "❌ Error: Este script debe ejecutarse como root (usa sudo)."
   exit 1
fi

echo "🔍 Detectando distribución del sistema operativo..."
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS_ID=$ID
    OS_LIKE=$ID_LIKE
else
    echo "❌ No se pudo detectar la distribución (/etc/os-release no encontrado)."
    exit 1
fi

# Detectar carpeta de configuración de Zabbix Agent (Agent 2 o Agent clásico)
if [ -d "/etc/zabbix/zabbix_agent2.d" ]; then
    ZABBIX_CONF_DIR="/etc/zabbix/zabbix_agent2.d"
    ZABBIX_MAIN_CONF="/etc/zabbix/zabbix_agent2.conf"
    ZABBIX_SERVICE="zabbix-agent2"
    ZABBIX_BIN="zabbix_agent2"
elif [ -d "/etc/zabbix/zabbix_agentd.d" ]; then
    ZABBIX_CONF_DIR="/etc/zabbix/zabbix_agentd.d"
    ZABBIX_MAIN_CONF="/etc/zabbix/zabbix_agentd.conf"
    ZABBIX_SERVICE="zabbix-agent"
    ZABBIX_BIN="zabbix_agentd"
else
    echo "❌ No se encontró el directorio de configuración de Zabbix Agent (/etc/zabbix/zabbix_agent2.d o zabbix_agentd.d)."
    echo "   Asegúrate de tener instalado zabbix-agent2 o zabbix-agent antes de ejecutar este script."
    exit 1
fi

echo "✅ Agente detectado: $ZABBIX_SERVICE ($ZABBIX_CONF_DIR)"

# Configurar parámetros según familia de distribución
CONF_FILE="$ZABBIX_CONF_DIR/updates.conf"

if [[ "$OS_ID" =~ ^(rhel|rocky|almalinux|centos|ol|fedora)$ ]] || [[ "$OS_LIKE" =~ (rhel|fedora|centos) ]]; then
    echo "📦 Configurando para Familia RHEL ($NAME)..."
    systemctl enable --now dnf-makecache.timer 2>/dev/null || true
    cat << 'EOF' > "$CONF_FILE"
UserParameter=system.updates.total,dnf -C -q check-update | grep -E '^[a-zA-Z0-9._-]+\.(x86_64|noarch|i686|aarch64)' | wc -l
UserParameter=system.updates.security,dnf -C -q updateinfo list security available | wc -l
EOF

elif [[ "$OS_ID" == "ubuntu" ]]; then
    echo "📦 Configurando para Ubuntu ($VERSION_ID)..."
    if ! dpkg -l | grep -q update-notifier-common; then
        echo "⏳ Instalando update-notifier-common..."
        apt-get update -qq && apt-get install -y -qq update-notifier-common
    fi
    cat << 'EOF' > "$CONF_FILE"
UserParameter=system.updates.total,/usr/lib/update-notifier/apt-check 2>&1 | cut -d';' -f1
UserParameter=system.updates.security,/usr/lib/update-notifier/apt-check 2>&1 | cut -d';' -f2
EOF

elif [[ "$OS_ID" == "debian" ]] || [[ "$OS_LIKE" =~ debian ]]; then
    echo "📦 Configurando para Debian ($VERSION_ID)..."
    systemctl enable --now apt-daily.timer 2>/dev/null || true
    cat << 'EOF' > "$CONF_FILE"
UserParameter=system.updates.total,apt-get -s upgrade | grep -c "^Inst "
UserParameter=system.updates.security,apt-get -s upgrade | grep "^Inst " | grep -c -i "security"
EOF

elif [[ "$OS_ID" =~ ^(sles|opensuse|opensuse-leap|opensuse-tumbleweed)$ ]] || [[ "$OS_LIKE" =~ suse ]]; then
    echo "📦 Configurando para SUSE / openSUSE ($NAME)..."
    cat << 'EOF' > "$CONF_FILE"
UserParameter=system.updates.total,zypper --non-interactive --no-refresh list-updates | grep -c "^v |"
UserParameter=system.updates.security,zypper --non-interactive --no-refresh list-patches --category security | grep -c "| needed"
EOF

else
    echo "❌ Distribución no soportada automáticamente: $OS_ID"
    exit 1
fi

chmod 644 "$CONF_FILE"

# Ajustar Timeout=15 en la configuración principal de Zabbix Agent
echo "⏱️ Ajustando Timeout=15 en $ZABBIX_MAIN_CONF..."
if grep -qE "^#?\s*Timeout=" "$ZABBIX_MAIN_CONF"; then
    sed -i 's/^#*\s*Timeout=.*/Timeout=15/' "$ZABBIX_MAIN_CONF"
else
    echo "Timeout=15" >> "$ZABBIX_MAIN_CONF"
fi

# Reiniciar servicio
echo "🔄 Reiniciando servicio $ZABBIX_SERVICE..."
systemctl restart "$ZABBIX_SERVICE"

# Verificación inmediata
echo "🧪 Probando claves locales de Zabbix..."
echo -n "   -> system.updates.total:    "
$ZABBIX_BIN -t system.updates.total | grep -o "\[.*\]" || echo "Error"
echo -n "   -> system.updates.security: "
$ZABBIX_BIN -t system.updates.security | grep -o "\[.*\]" || echo "Error"

echo "🎉 ¡Instalación completada! Ahora vincula la plantilla 'OS Linux - Package Updates' en Zabbix."
