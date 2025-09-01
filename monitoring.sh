#!/bin/bash

# ARCHITECTURE
arch=$(uname -a)

# CPU PHYSICAL
cpup=$(grep "physical id" /proc/cpuinfo | wc -l)

# CPU VIRTUAL
cpuv=$(grep "processor" /proc/cpuinfo | wc -l)

# RAM
ram_total=$(free -m | awk '$1 == "Mem:" {print $2}')
ram_use=$(free -m | awk '$1 == "Mem:" {print $3}')
ram_percent=$(free -m | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')

# DISK
disk_total=$(df -BG | grep '^/dev/' | grep -v '/boot$' | awk '{disk_t += $2} END {print disk_t}')
disk_use=$(df -BG | grep '^/dev/' | grep -v '/boot$' | awk '{disk_u += $3} END {print disk_u}')
disk_percent=$(df -BG | grep '^/dev/' | grep -v '/boot$' | awk '{disk_u += $3} {disk_t+= $2} END {printf("%d"), disk_u/disk_t*100}')

# CPU LOAD
cpu_load=$(top -bn1 | grep load | awk '{printf "%.2f%%\n", $(NF-2)}')

# LAST BOOT
lb=$(who -b | awk '$1 == "system" {print $3 " " $4}')

# LVM USE
lvmu=$(if lsblk -o TYPE | grep -iq "^lvm$"; then echo yes; else echo no; fi)

# TCP CONNECTIONS
tcpc=$(ss -ta | grep ESTAB | wc -l)

# USER LOG
ulog=$(w -h | wc -l)

# NETWORK
ip=$(hostname -I | awk '{print $1}')
mac=$(ip link show | grep "ether" | awk '{print $2}')

# SUDO
cmnd=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

wall    "
        #Architecture: $arch
        #CPU physical: $cpup
        #vCPU: $cpuv
        #Memory Usage: $ram_use/${ram_total}MB ($ram_percent%)
        #Disk Usage: $disk_use/${disk_total}Gb ($disk_percent%)
		#CPU load: $cpu_load
        #Last boot: $lb
        #LVM use: $lvmu
        #Connections TCP: $tcpc ESTABLISHED
        #User log: $ulog
        #Network: IP $ip ($mac)
        #Sudo: $cmnd cmd"

msg="
        #Architecture: $arch
        #CPU physical: $cpup
        #vCPU: $cpuv
        #Memory Usage: $ram_use/${ram_total}MB ($ram_percent%)
        #Disk Usage: $disk_use/${disk_total}Gb ($disk_percent%)
        #CPU load: $cpu_load
        #Last boot: $lb
        #LVM use: $lvmu
        #Connections TCP: $tcpc ESTABLISHED
        #User log: $ulog
        #Network: IP $ip ($mac)
        #Sudo: $cmnd cmd"

for tty in /dev/pts/*; do
        [ -w "$tty" ] && echo "$msg" > "$tty"
done
