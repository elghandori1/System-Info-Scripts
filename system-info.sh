#!/bin/bash

# system-info.sh - Display full system configuration on Linux

echo -e "\e[36m=== System Information ===\e[0m"

# Computer name
echo -n "Hostname: "
hostname

# Username
echo -n "User Name: "
whoami

# Manufacturer and Model
echo -n "System Brand/Model: "
if [ -f /sys/devices/virtual/dmi/id/product_name ]; then
    manufacturer=$(cat /sys/devices/virtual/dmi/id/sys_vendor 2>/dev/null)
    model=$(cat /sys/devices/virtual/dmi/id/product_name 2>/dev/null)
    echo "$manufacturer $model"
else
    dmidecode -s system-product-name | head -1
fi

# Operating System
echo -n "OS Version: "
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "$PRETTY_NAME"
elif [ -f /etc/redhat-release ]; then
    cat /etc/redhat-release
else
    uname -s -r
fi

# System Architecture
echo -n "System Type: "
uname -m

# Processor Info
echo -n "Processor: "
cat /proc/cpuinfo | grep "model name" | head -n 1 | cut -d ":" -f 2 | sed 's/^[ \t]*//'

# Cores
echo -n "Cores (Physical): "
nproc --all

echo -n "Threads (Logical): "
cat /proc/cpuinfo | grep processor | wc -l

# CPU Speed (GHz)
echo -n "CPU Speed: "
lscpu | grep "MHz" | head -n 1 | awk '{printf "%.2f GHz\n", $3/1000}'

# RAM Info
echo -n "Total RAM (GB): "
free -h | grep Mem | awk '{print $2}'

# GPU Info
echo -n "Graphics Card: "
if command -v lspci &> /dev/null; then
    lspci | grep -i vga | cut -d ":" -f 3 | sed 's/^[ \t]*//'
else
    echo "lspci not available"
fi

# Disk Info
echo -e "\e[36m=== Storage Information ===\e[0m"
df -h | grep -v "tmpfs" | grep -v "udev" | grep -v "^Filesystem"

echo -e "\e[32mDone!\e[0m"