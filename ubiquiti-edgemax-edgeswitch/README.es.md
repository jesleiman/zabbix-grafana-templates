🌐 *Leer en [Inglés](README.md)*

# Monitoreo de Ubiquiti EdgeMAX y EdgeSwitch con Zabbix

Plantillas de Zabbix diseñadas para monitorear routers **Ubiquiti EdgeRouter (EdgeMAX)** y switches **EdgeSwitch** mediante **SNMPv2c**, supervisando tráfico de interfaces, salud del hardware y *uptime*.

## 🛠️ Compatibilidad Probada
* **Versión de Zabbix:** 7.0.32
* **Protocolo:** SNMPv2c
* **Dependencia Base:** `Generic by SNMP` (incluida por defecto en Zabbix)

> **Nota sobre MIBs:** Si tus plantillas utilizan OIDs textuales en lugar de numéricos, asegúrate de instalar en `/usr/share/snmp/mibs/` de tu servidor Zabbix los archivos MIB de Ubiquiti (`UBNT-EdgeMAX-MIB` y `UBNT MIB`) que ya se encuentran disponibles en la carpeta [`ubiquiti-olt/mibs/`](../ubiquiti-olt/mibs/).
## 📦 Plantillas Incluidas (`zabbix/`)
* `Ubiquiti EdgeMAX SNMPv2` (Serie EdgeRouter)
* `Ubiquiti EdgeSwitch SNMP v2` (Serie EdgeSwitch general)
* `Ubiquiti EdgeSwitch 8 150W SNMP` (Perfil específico para modelo 8 puertos 150W)

## 🚀 Instalación
1. Habilita **SNMPv2c** en tu equipo EdgeMAX o EdgeSwitch.
2. Importa el archivo `.yaml` desde `zabbix/` en **Data collection > Templates > Import**.
3. Crea el host en Zabbix con una interfaz **SNMP** (puerto `161`, `SNMPv2`) y asocia la plantilla.
