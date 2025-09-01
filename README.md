# Born2beRoot 🐧

This repository contains my implementation of the Born2BeRoot project from 42 School and is also a manual for solving the problems from the Debian 13 version.
The goal is to set up a virtual machine (VM) running the latest version of Debian or Rocky and to get introduced to system administration concepts, virtualization, operating systems, security and task automation.

## 📋 About the project

In this repository we will install Debian 13.0.0 (Trixie) with strict security rules, including encrypted partitions, SSH configuration, firewall setup, strong password policies, sudo restrictions, and a monitoring script that runs via cron.

## 🎯 Objectives

- Set up a virtual machine using VirtualBox
- Install and configure Debian
- Implement robust security policies
- Configure essential services (SSH, UFW)
- Create automated monitoring scripts
- Apply system administration best practices

## 🛠️ Technologies Used

- **VirtualBox 7.0.24** - Virtualization platform
- **Debian 13.0.0**  - Base operating system
- **SSH** - Secure remote access
- **UFW** - Simplified firewall
- **Cron** - Task scheduling
- **Bash** - Automation scripts

## 📦 Implemented Configurations

### Base System
- Virtual machine with 2GB RAM and 10GB storage
- Debian with encrypted LVM partitioning
- User and group configuration

### Security
- **Strong password policy:**
  - Minimum 10 characters
  - At least 1 uppercase, 1 lowercase, and 1 digit
  - Maximum 3 consecutive repeated characters
  - Cannot contain username
  - Minimum 7 characters different from previous password

- **Sudo configuration:**
  - Maximum 3 password attempts
  - Custom message for incorrect password
  - Complete logging of sudo commands
  - TTY required for sudo commands

### Network Services
- **SSH configured on port 4242**
- **UFW active** allowing only port 4242
- **Root login disabled** via SSH

### Automated Monitoring
- Monitoring script executed every 10 minutes
- Displays real-time system information:
  - System architecture
  - Physical and virtual CPUs
  - RAM usage
  - Disk usage
  - CPU load
  - Last boot
  - LVM status
  - Active TCP connections
  - Logged users
  - Network configuration
  - Executed sudo commands

## 📁 Project Structure

```
born2beroot/
├── crontab.md          # Cron configuration
├── install.md          # Installation guide
├── monitoring.sh       # Monitoring script
├── visudo.md          # Sudo configuration
└── README.md          # This file
```

## 🚀 How to Use

### 1. VM Installation
```bash
# Follow the detailed guide in install.md
# 1. Install VirtualBox
# 2. Download Debian iso
# 3. Configure VM with project specifications
```

### 2. System Configuration
```bash
# Install and configure sudo
sudo apt install sudo
sudo adduser [login] sudo

# Configure SSH on port 4242
sudo vim /etc/ssh/sshd_config

# Configure UFW
sudo apt install ufw
sudo ufw enable
sudo ufw allow 4242
```

### 3. Monitoring Script
```bash
# Make script executable
sudo chmod +x /usr/local/bin/monitoring.sh

# Configure cron for execution every 10 minutes
sudo crontab -e
# Add: */10 * * * * sh /usr/local/bin/monitoring.sh
```

## 🔧 Useful Commands

### System Verification
```bash
# SSH status
sudo service ssh status

# UFW status
sudo ufw status

# Check cron jobs
sudo crontab -l

# Sudo logs
sudo cat /var/log/sudo/sudo.log
```

### User Management
```bash
# List user groups
groups [username]

# Check password policy
sudo chage -l [username]
```

## 📊 Monitoring Output Example

```
#Architecture: Linux login42 5.10.0-8-amd64 #1 SMP Debian x86_64 GNU/Linux
#CPU physical: 1
#vCPU: 1
#Memory Usage: 157/2048MB (7.67%)
#Disk Usage: 2/10Gb (25%)
#CPU load: 0.08%
#Last boot: 2024-01-15 10:30
#LVM use: yes
#Connections TCP: 1 ESTABLISHED
#User log: 1
#Network: IP 10.0.2.15 (08:00:27:51:4c:68)
#Sudo: 42 cmd
```

## 🎓 Concepts Learned

- **Virtualization** - VM creation and management
- **Linux Administration** - Debian system configuration
- **Security** - Password policies, firewall, SSH
- **Automation** - Bash scripts and cron scheduling
- **Monitoring** - System metrics collection and display
- **LVM** - Logical Volume Management and encryption

## 🔒 Security Considerations

- All passwords follow strict complexity policy
- Root login via SSH is disabled
- Firewall configured to allow only necessary connections
- Detailed logging of all administrative actions
- Disk encryption implemented

## 📝 Notes

This project implements only the **mandatory part** of the requirements. The focus is on demonstrating proficiency in:
- Secure Linux system configuration
- Security policy implementation
- Basic administrative task automation
- System resource monitoring

---

**Project developed as part of the 42 School curriculum**
