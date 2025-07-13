#!/usr/bin/env sh

convertKBToGB()
{
    param="$1"
    float_value=$(( $1 * 100 / 1048576 ))
    int_value=$((float_value/100))
    frac_value=$((float_value % 100))
    GB="$int_value.$frac_value"
    echo $GB
}

convertToPercentage(){
    part="$1"
    whole="$2"
    percentage=$((part * 100 / whole))
    echo "$percentage"
}

echo "--------CPU USAGE---------"
echo "$(top -b -n1 | grep 'Cpu' | awk '{print $2+$4 }')%"

echo "--------RAM USAGE---------"
echo "$(free -m | grep 'Mem' | awk '{printf "Total: %d MB \nUsed: %d MB \nFree: %d MB", $2, $3, $4}')"

echo "--------DISK USAGE---------"
echo "$(df -k --total | grep 'total' | awk '{print $5}')"

echo "--------Top 5 Cpu process--------"
echo "$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6)"

echo "--------Top 5 RAM process--------"
echo "$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -6)"

echo "--------Logged In Users----------"
echo "$(who)"

echo "--------Additional Information--------"
echo "Operating System: $(awk -F=  '/^NAME/ {gsub(/"/,"",$2); print $2}' /etc/os-release)"
echo "Uptime: $(uptime -p | awk '{print $2 $3 $4 $5}')"

