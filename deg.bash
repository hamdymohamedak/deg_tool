#!/bin/bash

# Define the degree symbol or string
theDegree="Degree"

# Infinite loop
while true; do
    # Read the temperature value
    temp=$(cat /sys/class/thermal/thermal_zone1/temp)
    
    # Fix the temperature value by dividing by 1000 (since temp is usually in millidegrees)
    temp_fix=$(($temp / 1000))
    
    # Define color codes
    red="\e[31m"
    green="\e[32m"
    reset="\e[0m"
    
    # Check the temperature and print with the appropriate color
    if [[ $temp_fix -lt 80 ]]; then
        echo -e "${green}${temp_fix} ${theDegree}${reset}"
    else
        echo -e "${red}${temp_fix} ${theDegree}${reset}"
    fi
    
    # Sleep for 2.2 seconds
    sleep 2.2
done

