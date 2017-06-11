#!/bin/bash

###################################
# Configure ThingSpeak
###################################

#For example to update write_key for ThingSpeak cloud: 
# jq '.[] | map((select(.script == "python CloudThingSpeak.py") | .write_key) |= "")' clouds.json

sudo chmod 660 /home/pi/lora_gateway/clouds.json
tmp=$(mktemp)
if [ $# == 2 ] 
then
        jq '.clouds=([.clouds[]  | select(.script == "python CloudThingSpeak.py") .'$1' = '$2'])' /home/pi/lora_gateway/clouds.json > "$tmp" && mv "$tmp" /home/pi/lora_gateway/clouds.json
        sudo chmod +r /home/pi/lora_gateway/clouds.json
fi
