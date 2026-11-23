🌐 *Leer en [Inglés](README.md)*

# Monitoreo de Ubiquiti airMAX / airOS con Zabbix

Plantillas de Zabbix diseñadas para monitorear radios inalámbricos **Ubiquiti airMAX (Series AC y M)** mediante **SNMPv2c**, incluyendo plantillas complementarias opcionales para geolocalización en mapas (`Ubiquiti GEO`) y conteo de estaciones conectadas en radio bases (`Ubiquiti Rol AP`).

## 🛠️ Compatibilidad Probada
* **Versión de Zabbix:** 7.0.32
* **Protocolo:** SNMPv2c
* **Dependencia Base:** `Generic by SNMP` (incluida por defecto en Zabbix)
* **Modelos Probados:** PowerBeam 5AC (Estándar / ISO / 500 ISO), Rocket 5AC Lite, Rocket Prism 5AC, LiteBeam 5AC (Estándar / 23), NanoStation 5AC, NanoStation 5AC loco, NanoBeam 5AC 16, PowerBeam M5, NanoBridge M2, NanoStation M365, Rocket M365.

> **Nota sobre MIBs:** Si tus plantillas utilizan OIDs textuales en lugar de numéricos, asegúrate de instalar en `/usr/share/snmp/mibs/` de tu servidor Zabbix los archivos MIB de Ubiquiti (`UBNT-EdgeMAX-MIB` y `UBNT MIB`) que ya se encuentran disponibles en la carpeta [`ubiquiti-olt/mibs/`](../ubiquiti-olt/mibs/).

## 📦 Plantillas Incluidas (`zabbix/`)

### Plantillas por Serie y Modelo
* `Ubiquiti AirOS by SNMP` / `Ubiquiti AirOS SNMP`
* `Ubiquiti Nanostation V2`
* `Ubiquiti Power Beam AC` / `Ubiquiti Power Beam AC - ISO`
* `Ubiquiti Rocket AC Lite`

### Módulos Complementarios Opcionales (Vinculables por Host)
* **`Ubiquiti GEO`:** Obtiene las coordenadas de latitud y longitud vía SNMP para posicionar automáticamente el equipo en los **Mapas de Zabbix**.
* **`Ubiquiti Rol AP`:** Plantilla adicional exclusiva para **Radio Bases / Access Points** que contabiliza el total de antenas/clientes conectados.

## 🚀 Instalación
1. Activa **SNMPv2c** en tus equipos Ubiquiti airOS (**Services > SNMP**).
2. Importa las plantillas `.yaml` que necesites desde `zabbix/` en **Data collection > Templates > Import**.
3. Crea el host en Zabbix con una interfaz **SNMP** (puerto `161`, `SNMPv2`) y asocia la plantilla del radio.
4. *(Opcional)* Vincula también **`Ubiquiti GEO`** (para mapas) y/o **`Ubiquiti Rol AP`** (para Radio Bases) directamente en el host.
