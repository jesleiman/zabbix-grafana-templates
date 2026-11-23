🌐 *Leer en [Inglés](README.md)*

# Colección de Templates de Zabbix y Dashboards de Grafana

Colección de **plantillas de Zabbix** y **dashboards de Grafana** personalizados para infraestructura de red, equipos de telecomunicaciones y sistemas VoIP/PBX. Probados en entornos reales.

## 🛠️ Entorno y Compatibilidad

| Herramienta | Versión Probada |
| :--- | :--- |
| **Zabbix** | 7.0.32 |
| **Grafana** | v13.3.1 |

---

## 📦 Templates y Dashboards Disponibles

| Device / Platform | Includes | Protocol / Method | Extra Files | Documentation |
| :--- | :--- | :--- | :--- | :--- |
| **Issabel PBX 5** | Zabbix + Grafana | Zabbix Agent | `userparameter_asterisk.conf` | [View Guide](issabel-pbx/README.md) |
| **Ubiquiti UFiber OLT (4 & 8)** | Zabbix + Grafana | SNMPv2c | `UBNT-UFIBER-MIB` | [View Guide](ubiquiti-olt/README.md) |
| **Ubiquiti airMAX / airOS** | Zabbix Only | SNMPv2c | `Ubiquiti GEO` & `Rol AP` | [View Guide](ubiquiti-airmax/README.md) |
| **Ubiquiti EdgeMAX & EdgeSwitch** | Zabbix Only | SNMPv2c | — | [View Guide](ubiquiti-edgemax-edgeswitch/README.md) |
| **Ubiquiti UniFi (U6-LR)** | Zabbix Only | SNMPv2c | — | [View Guide](ubiquiti-unifi/README.md) |

*(Más dispositivos y plantillas próximamente...)*

---

## 🚀 Uso General

1. **Ingresa a la carpeta del dispositivo** desde la tabla superior para revisar sus requisitos previos (`UserParameters` del agente, configuración SNMP o MIBs).
2. **Importa el template de Zabbix** (`.yaml`) desde **Data collection > Templates > Import**.
3. **Importa el dashboard de Grafana** (`.json`) desde **Dashboards > New > Import** y selecciónalo con tu *Data Source* de Zabbix.

---

## 🤝 Contribuciones y Reportes
Si encuentras algún error, deseas proponer mejoras o has probado estas plantillas en otras versiones de firmware o software, puedes abrir un **Issue** o enviar un **Pull Request**.
