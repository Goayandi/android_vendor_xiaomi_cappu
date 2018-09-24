#!/system/bin/sh
# globeROM _______________________________________________________________________________________
#
# This script shows information about CPU and Battery Stats!
#
# 2016 Â
# www.mi-globe.com
# ________________________________________________________________________________________________
echo "------------------------"
echo "ROM    : `getprop ro.build.display.id`"
echo "Device : `getprop ro.product.model`"
echo ""
echo "Disk Free :"
echo "`df 2>/dev/null | grep -e '^/system' -e '^/data ' |awk '{ print "            "$1"\n            Size= "$2"\n            Used= "$3"\n            Free= "$4"\n"}'`"
echo "------------------------"
echo "CPU Frequencies"
echo ""
cd /sys/devices/system/cpu/
for i in $(ls |grep 'cpu[0-9][0-9]*' | cut -c 4-)
do
	if [ -f /sys/devices/system/cpu/cpu${i}/cpufreq/scaling_cur_freq  ]
	then
		curr=`cat /sys/devices/system/cpu/cpu$i/cpufreq/scaling_cur_freq`
		max=`cat /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq`
		gov=$(cat /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor)
		state=ONLINE
	else
		state=OFFLINE
	fi
	echo CPU $i
	if [ "$state" == OFFLINE  ]
	then
		echo $state
	else
		echo "Current Freq = $curr"
		echo "Max     Freq = $max"
		echo "CPU Governor = $gov"
	fi
	echo ""
done
echo "------------------------"
echo "Battery Stats"
echo ""
temp=`cat /sys/class/power_supply/battery/temp | sed 's/^\(.\)\(.\)\(.\)$/\1\2,\3 Â°C/g'`
status=`cat /sys/class/power_supply/battery/status`
capacity=`cat /sys/class/power_supply/battery/capacity`
health=`cat /sys/class/power_supply/battery/health`
voltage=`cat /sys/class/power_supply/battery/voltage_now`
current_now=`cat /sys/class/power_supply/battery/current_now`                  
current_now_charge=`cat /sys/class/power_supply/battery/current_now | cut -c 1`
if [ $current_now_charge == "-" ]                                 
then
	current_now_charge_text=Charging
else
	current_now_charge_text=Discharging
fi                                                          
echo "Temperature  = $temp"                                       
echo "Level        = $capacity %"                                 
echo "Health       = $health"                                     
echo "Curr Voltage = $voltage"                                    
echo "Power Status = $current_now mA ( $current_now_charge_text )"
exit 0
