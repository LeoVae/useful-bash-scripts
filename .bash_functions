### Tools and such ###
#CPU frequency monitor
cpufmon() {

echo "Add '-a' for all CPU cores."

red="\e[91m"
green="\e[92m"
blue="\e[94m"
yellow="\e[93m"
endcolor="\e[0m"

while true
  do 
    #clear ## Uncomment this to clear screen before each refresh (similar to watch)
    all_cores=$(cat /proc/cpuinfo | grep -i mhz | awk '{print $4}' | awk -F "." '{print $1}')
    average=$(echo "${all_cores}" | awk 'BEGIN{s=0;}{s=s+$1;}END{print s/NR;}' | awk -F "." '{print $1}')
    lowest=$(echo "${all_cores}" | sort -rn | tail -n1)
    highest=$(echo "${all_cores}" | sort -n | tail -n1)

    if [[ "${1}" == "-a" ]]; then
      echo
      echo -e "${yellow}All cores (MHz):${endcolor} ${all_cores}" | xargs
    fi  
    echo -e "${green}Average:${endcolor} ${average} MHz  ${blue}Lowest:${endcolor} ${lowest} MHz  ${red}Highest:${endcolor} ${highest} MHz"

    sleep 0.7 
done
}
