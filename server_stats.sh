#!/usr/bin/env sh

# prints cpu usage by using the top program. 
echo "--------CPU USAGE---------"
echo "$(top -b -n1 | grep 'Cpu' | awk '{print $2+$4 }')%"

#prints RAM usage by using the free program.
echo "--------RAM USAGE---------"
echo "$(free -m | grep 'Mem' | awk '{printf "Total: %d MB \nUsed: %d MB \nFree: %d MB", $2, $3, $4}')"

#prints disk usage by using the df program.
echo "--------DISK USAGE---------"
echo "$(df -k --total | grep 'total' | awk '{print $5}')"

#prints top 5 CPU usage by using the ps program.
echo "--------Top 5 Cpu process--------"
echo "$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6)"

#prints top 5 RAM usage by using the ps program.
echo "--------Top 5 RAM process--------"
echo "$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -6)"

#prints logged in users by using the who program.
echo "--------Logged In Users----------"
echo "$(who)"

echo "--------Additional Information--------"
echo "Operating System: $(awk -F=  '/^NAME/ {gsub(/"/,"",$2); print $2}' /etc/os-release)"
echo "Uptime: $(uptime -p | awk '{print $2 $3 $4 $5}')"

