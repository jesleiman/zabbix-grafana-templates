🌐 *Read this in [Spanish](README.es.md)*

# Ubiquiti UniFi Access Points (U6-LR) Monitoring with Zabbix

Zabbix template designed to monitor **Ubiquiti UniFi Access Points** via **SNMPv2c**, tracking connected wireless clients, radio utilization, interface traffic, CPU/memory load, and uptime.

## 🛠️ Tested Compatibility
* **Zabbix Version:** 7.0.32
* **Protocol:** SNMPv2c
* **Tested Hardware:** UniFi U6-LR

## ⚙️ Prerequisites on UniFi Controller / Network App
1. Open your **UniFi Network** application.
2. Go to **Settings > System > Advanced** (or **Services > SNMP** depending on controller version).
3. Enable **SNMPv1/v2c** and set your **Community String** (e.g., `public`).

## 🚀 Zabbix Setup
1. Import the `.yaml` template from `zabbix/` via **Data collection > Templates > Import**.
2. Add your Access Point in Zabbix with an **SNMP interface** (port `161`, version `SNMPv2`) and link the template.
