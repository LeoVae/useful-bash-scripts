### Tools and such ###
# CPU cores monitor ; shows all cores' average and highest core's frequency
cpufmon() {
while true
  do 
    #clear
    all_cores=$(cat /proc/cpuinfo | grep -i mhz | awk '{print $4}' | awk -F "." '{print $1}')
    average=$(echo "${all_cores}" | awk 'BEGIN{s=0;}{s=s+$1;}END{print s/NR;}' | awk -F "." '{print $1}')
    highest=$(echo "${all_cores}" | sort -n | tail -n1)
    echo "Average: ${average} MHz   Highest: ${highest} MHz" | column -t
    sleep 0.7 
done
}
