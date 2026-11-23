🌐 *Read this in [Spanish](README.es.md)*

# Ubiquiti airMAX / airOS Monitoring with Zabbix

Zabbix templates designed to monitor **Ubiquiti airMAX (AC & M Series)** wireless radios via **SNMPv2c**, including optional add-on templates for native geolocation mapping (`Ubiquiti GEO`) and connected station counters for Base Stations (`Ubiquiti Rol AP`).

## 🛠️ Tested Compatibility
* **Zabbix Version:** 7.0.32
* **Protocol:** SNMPv2c
* **Base Dependency:** `Generic by SNMP` (built-in Zabbix template)
* **Tested Models:** PowerBeam 5AC (Standard / ISO / 500 ISO), Rocket 5AC Lite, Rocket Prism 5AC, LiteBeam 5AC (Standard / 23), NanoStation 5AC, NanoStation 5AC loco, NanoBeam 5AC 16, PowerBeam M5, NanoBridge M2, NanoStation M365, Rocket M365.

> **Note on MIBs:** If your templates use textual OIDs instead of numeric ones, make sure to install the Ubiquiti MIB files (`UBNT-EdgeMAX-MIB` and `UBNT MIB`) already included in the [`ubiquiti-olt/mibs/`](../ubiquiti-olt/mibs/) directory into `/usr/share/snmp/mibs/` on your Zabbix Server.

## 📦 Included Templates (`zabbix/`)

### Device & Series Templates
* `Ubiquiti AirOS by SNMP` / `Ubiquiti AirOS SNMP`
* `Ubiquiti Nanostation V2`
* `Ubiquiti Power Beam AC` / `Ubiquiti Power Beam AC - ISO`
* `Ubiquiti Rocket AC Lite`

### Optional Add-on Modules (Linkable per Host)
* **`Ubiquiti GEO`:** Retrieves latitude and longitude coordinates via SNMP so Zabbix automatically places the radio on **Zabbix Maps**.
* **`Ubiquiti Rol AP`:** Dedicated add-on template for **Access Points / Base Stations** to count the total number of connected wireless clients/stations.

## 🚀 Setup
1. Enable **SNMPv2c** on your Ubiquiti airOS devices (**Services > SNMP**).
2. Import the desired `.yaml` templates from `zabbix/` via **Data collection > Templates > Import**.
3. Create your host in Zabbix with an **SNMP interface** (port `161`, `SNMPv2`) and link the radio template.
4. *(Optional)* Link **`Ubiquiti GEO`** (for maps) and/or **`Ubiquiti Rol AP`** (for Base Stations) directly to your host.
