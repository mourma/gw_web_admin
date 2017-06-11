#!/bin/bash

###################################
# configure gateway
###################################

#For example to update channel number: radio_conf => ch => value
#jq '.radio_conf.ch = 12' gateway_conf.json > "$tmp" && mv "$tmp" gateway_conf.json

tmp=$(mktemp)
if [ $# == 3 ] 
then
        jq '.'"$1"'.'"$2"' = "'$3'" ' /home/pi/lora_gateway/gateway_conf.json > "$tmp" && mv "$tmp" /home/pi/lora_gateway/gateway_conf.json
        sudo chmod +r /home/pi/lora_gateway/gateway_conf.json
fi
