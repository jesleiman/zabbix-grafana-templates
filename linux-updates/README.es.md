🌐 *Leer en [Inglés](README.md)*

# Monitoreo de Actualizaciones Pendientes y de Seguridad en Linux con Zabbix

Plantilla unificada de Zabbix (`OS Linux - Package Updates`) y parámetros de `Zabbix Agent 2` para monitorear el **total de actualizaciones pendientes** y las **actualizaciones de seguridad** en las principales distribuciones Linux (**Familia RHEL, Ubuntu, Debian y SUSE/openSUSE**).

## 🛠️ Compatibilidad Probada
* **Versión de Zabbix:** 7.0.32
* **Agente:** Zabbix Agent 2 (`zabbix-agent2`)
* **Distribuciones Soportadas:**
  * **Familia RHEL:** Rocky Linux, AlmaLinux, CentOS Stream, Oracle Linux, Fedora
  * **Ubuntu:** 20.04, 22.04, 24.04, 26.04
  * **Debian:** 11, 12, 13
  * **SUSE / openSUSE:** SLES, Leap

---

## ⚙️ Requisitos Previos por Distribución

Antes de configurar el agente de Zabbix, asegúrate de que la caché de paquetes se actualice automáticamente en cada sistema:

### 1. Familia RHEL (Rocky Linux, AlmaLinux, CentOS Stream, Oracle Linux, Fedora)
Activa el temporizador automático de caché de DNF:
```bash
systemctl enable --now dnf-makecache.timer
```

### 2. Ubuntu (20.04, 22.04, 24.04, 26.04)
Verifica que esté instalado el paquete `update-notifier-common` (viene por defecto en casi todas las instalaciones de Ubuntu Server):
```bash
apt update && apt install -y update-notifier-common
```

### 3. Debian (11, 12, 13)
Activa el temporizador diario de APT para mantener actualizada la lista local de paquetes:
```bash
systemctl enable --now apt-daily.timer
```

### 4. SUSE / openSUSE (SLES, Leap)
Utiliza `zypper` de forma nativa sin paquetes adicionales.

---

## 🚀 Instalación en Zabbix Agent 2 y Servidor### ⚡ Opción A: Instalación Automática en un Comando (Recomendado)
Ejecuta el script instalador como `root` (o con `sudo`). Detecta automáticamente tu distribución Linux, activa los temporizadores de caché, crea `/etc/zabbix/zabbix_agent2.d/updates.conf`, ajusta `Timeout=15`, reinicia el agente y prueba las claves:

```bash
curl -fsSL https://raw.githubusercontent.com/jesleiman/zabbix-grafana-templates/refs/heads/main/linux-updates/install-updates-monitor.sh | sudo bash
```

### 🛠️ Opción B: Instalación Manual

### 1. Instalar los UserParameters de la Distribución
Descarga o copia el archivo `.conf` correspondiente desde [`agent/`](agent/) hacia `/etc/zabbix/zabbix_agent2.d/updates.conf` (reemplaza `<DISTRO>` por `rhel`, `ubuntu`, `debian` o `suse`):

```bash
curl -o /etc/zabbix/zabbix_agent2.d/updates.conf https://githubusercontent.com<DISTRO>.conf
```

### 2. Ajustar Timeout y Reiniciar Zabbix Agent 2
La consulta de paquetes puede tardar unos segundos. Aumenta `Timeout=15` en `/etc/zabbix/zabbix_agent2.conf` y reinicia el servicio:

```bash
sed -i 's/^#* *Timeout=.*/Timeout=15/' /etc/zabbix/zabbix_agent2.conf
systemctl restart zabbix-agent2
```

### 3. Verificar Localmente desde la Terminal
Comprueba que el agente lee ambas claves correctamente:
```bash
zabbix_agent2 -t system.updates.total
zabbix_agent2 -t system.updates.security
```
Si ambos comandos devuelven `[s|NÚMERO]` (por ejemplo, `[s|15]`), la configuración quedó lista.

### 4. Importar Plantilla en Zabbix
1. Importa [`zabbix/template_os_linux_package_updates.yaml`](zabbix/) desde **Data collection > Templates > Import**.
2. Vincula **`OS Linux - Package Updates`** a tus servidores Linux.

