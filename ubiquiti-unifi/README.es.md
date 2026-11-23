🌐 *Leer en [Inglés](README.md)*

# Monitoreo de Ubiquiti UniFi Access Points (U6-LR) con Zabbix

Plantilla de Zabbix diseñada para monitorear **Access Points Ubiquiti UniFi** mediante **SNMPv2c**, supervisando clientes inalámbricos conectados, uso de radio, tráfico de interfaz, carga de CPU/memoria y *uptime*.

## 🛠️ Compatibilidad Probada
* **Versión de Zabbix:** 7.0.32
* **Protocolo:** SNMPv2c
* **Hardware probado:** UniFi U6-LR

## ⚙️ Requisitos previos en UniFi Controller / Network App
1. Abre tu consola **UniFi Network**.
2. Ve a **Settings > System > Advanced** (o **Services > SNMP** según la versión del controlador).
3. Activa **SNMPv1/v2c** y define tu **Comunidad SNMP** (ej. `public`).

## 🚀 Instalación en Zabbix
1. Importa la plantilla `.yaml` desde `zabbix/` en **Data collection > Templates > Import**.
2. Agrega el Access Point en Zabbix con una interfaz **SNMP** (puerto `161`, versión `SNMPv2`) y asocia la plantilla.
