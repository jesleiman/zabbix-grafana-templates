🌐 *Read this in [Spanish](README.es.md)*

# Linux OS Pending & Security Package Updates Monitoring with Zabbix

Unified Zabbix template (`OS Linux - Package Updates`) and `Zabbix Agent 2` UserParameters to monitor **total pending package updates** and **security updates** across major Linux distributions (**RHEL family, Ubuntu, Debian, and SUSE/openSUSE**).

## 🛠️ Tested Compatibility
* **Zabbix Version:** 7.0.32
* **Agent:** Zabbix Agent 2 (`zabbix-agent2`)
* **Supported Distributions:**
  * **RHEL Family:** Rocky Linux, AlmaLinux, CentOS Stream, Oracle Linux, Fedora
  * **Ubuntu:** 20.04, 22.04, 24.04, 26.04
  * **Debian:** 11, 12, 13
  * **SUSE / openSUSE:** SLES, Leap

> **Language Note:** Item names and trigger alert descriptions inside the Zabbix `.yaml` template are written in **Spanish** (e.g., *"{HOST.NAME}: Tiene X actualizaciones pendientes"*). You can easily translate or customize them directly in Zabbix under **Data collection > Templates** after importing.


---

## ⚙️ Prerequisites by Distribution

Before configuring the Zabbix agent, ensure the package cache refreshes automatically on each OS:

### 1. RHEL Family (Rocky Linux, AlmaLinux, CentOS Stream, Oracle Linux, Fedora)
Enable the automatic DNF metadata cache timer:
```bash
systemctl enable --now dnf-makecache.timer
```

### 2. Ubuntu (20.04, 22.04, 24.04, 26.04)
Ensure `update-notifier-common` is installed (included by default on most Ubuntu Server installations):
```bash
apt update && apt install -y update-notifier-common
```

### 3. Debian (11, 12, 13)
Enable the daily APT update timer so the local package index stays current:
```bash
systemctl enable --now apt-daily.timer
```

### 4. SUSE / openSUSE (SLES, Leap)
Uses `zypper` natively without additional packages.

---

### ⚡ Option A: Automatic One-Line Installation (Recommended)
Run the automated installer script as `root` (or with `sudo`). It automatically detects your Linux distribution, enables cache timers, creates `/etc/zabbix/zabbix_agent2.d/updates.conf`, sets `Timeout=15`, restarts the agent, and tests the keys:

```bash
curl -fsSL https://githubusercontent.com | sudo bash
```

### 🛠️ Option B: Manual Installation

## 🚀 Zabbix Agent 2 & Server Setup

### 1. Install the Distribution UserParameters
Download or copy the matching `.conf` file from [`agent/`](agent/) into `/etc/zabbix/zabbix_agent2.d/updates.conf` (replace `<DISTRO>` with `rhel`, `ubuntu`, `debian`, or `suse`):

```bash
curl -o /etc/zabbix/zabbix_agent2.d/updates.conf https://githubusercontent.com<DISTRO>.conf
```

### 2. Adjust Timeout & Restart Zabbix Agent 2
Package queries can take a few seconds on busy servers. Increase `Timeout=15` in `/etc/zabbix/zabbix_agent2.conf` and restart the service:

```bash
sed -i 's/^#* *Timeout=.*/Timeout=15/' /etc/zabbix/zabbix_agent2.conf
systemctl restart zabbix-agent2
```

### 3. Verify Locally from Terminal
Test that the agent reads both keys properly:
```bash
zabbix_agent2 -t system.updates.total
zabbix_agent2 -t system.updates.security
```
If both commands return `[s|NUMBER]` (e.g., `[s|15]`), the agent configuration is ready.

### 4. Import Template in Zabbix
1. Import [`zabbix/template_os_linux_package_updates.yaml`](zabbix/) via **Data collection > Templates > Import**.
2. Link **`OS Linux - Package Updates`** to your Linux hosts.
