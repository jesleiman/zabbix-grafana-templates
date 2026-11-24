🌐 *Read this in [Spanish](README.es.md)*

# Zabbix Templates & Grafana Dashboards Collection

A curated collection of custom **Zabbix templates** and **Grafana dashboards** for network infrastructure, telecom hardware, and VoIP/PBX systems. Tested in production environments.

## 🛠️ Environment & Compatibility

| Tool | Tested Version |
| :--- | :--- |
| **Zabbix** | 7.0.32 |
| **Grafana** | v13.3.1 |

---

## 📦 Available Templates & Dashboards


| Device / Platform | Includes | Protocol / Method | Extra Files | Documentation |
| :--- | :--- | :--- | :--- | :--- |
| **Issabel PBX 5** | Zabbix + Grafana | Zabbix Agent | `userparameter_asterisk.conf` | [View Guide](issabel-pbx/README.md) |
| **Ubiquiti UFiber OLT (4 & 8)** | Zabbix + Grafana | SNMPv2c | `UBNT-UFIBER-MIB` | [View Guide](ubiquiti-olt/README.md) |
| **Ubiquiti airMAX / airOS** | Zabbix Only | SNMPv2c | `Ubiquiti GEO` & `Rol AP` | [View Guide](ubiquiti-airmax/README.md) |
| **Ubiquiti EdgeMAX & EdgeSwitch** | Zabbix Only | SNMPv2c | — | [View Guide](ubiquiti-edgemax-edgeswitch/README.md) |
| **Ubiquiti UniFi (U6-LR)** | Zabbix Only | SNMPv2c | — | [View Guide](ubiquiti-unifi/README.md) |
| **Linux OS Package Updates** | Zabbix Only | Zabbix Agent 2 (`UserParameter`) | `updates-*.conf` (RHEL/Ubuntu/Debian/SUSE) | [View Guide](linux-updates/README.md) |


*(More devices and templates coming soon...)*

---

## 🚀 General Usage

1. **Browse the device folder** from the table above to review specific prerequisites (Agent `UserParameters`, SNMP settings, or custom MIBs).
2. **Import the Zabbix template** (`.yaml`) via **Data collection > Templates > Import**.
3. **Import the Grafana dashboard** (`.json`) via **Dashboards > New > Import** and link it to your Zabbix Data Source.

---

## 🤝 Contributions & Issues
Feel free to open an **Issue** or submit a **Pull Request** if you find a bug, want to suggest improvements, or have tested these templates on other firmware/software versions.
