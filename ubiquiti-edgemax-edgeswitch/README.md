🌐 *Read this in [Spanish](README.es.md)*

# Ubiquiti EdgeMAX & EdgeSwitch Monitoring with Zabbix

Zabbix templates designed to monitor **Ubiquiti EdgeRouter (EdgeMAX)** and **EdgeSwitch** devices via **SNMPv2c**, tracking interface statistics, hardware health, and system uptime.

## 🛠️ Tested Compatibility
* **Zabbix Version:** 7.0.32
* **Protocol:** SNMPv2c
* **Base Dependency:** `Generic by SNMP` (built-in Zabbix template)

## 📦 Included Templates (`zabbix/`)
* `Ubiquiti EdgeMAX SNMPv2` (EdgeRouter series)
* `Ubiquiti EdgeSwitch SNMP v2` (General EdgeSwitch series)
* `Ubiquiti EdgeSwitch 8 150W SNMP` (Specific model profile)

> **Note on MIBs:** If your templates use textual OIDs instead of numeric ones, make sure to install the Ubiquiti MIB files (`UBNT-EdgeMAX-MIB` and `UBNT MIB`) already included in the [`ubiquiti-olt/mibs/`](../ubiquiti-olt/mibs/) directory into `/usr/share/snmp/mibs/` on your Zabbix Server.

## 📦 Included Templates (`zabbix/`)
* `Ubiquiti EdgeMAX SNMPv2` (EdgeRouter series)
* `Ubiquiti EdgeSwitch SNMP v2` (General EdgeSwitch series)
* `Ubiquiti EdgeSwitch 8 150W SNMP` (Specific model profile)

## 🚀 Setup
1. Enable **SNMPv2c** on your EdgeMAX or EdgeSwitch device.
2. Import the `.yaml` template from `zabbix/` via **Data collection > Templates > Import**.
3. Create your host in Zabbix with an **SNMP interface** (port `161`, `SNMPv2`) and link the template.
