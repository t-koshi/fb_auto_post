#!/bin/bash

hexraw=$(sudo i2cget -y 1 0x48 0x00 w)

while [ "$hexraw" == "" ]; do

    hexraw=$(sudo i2cget -y 1 0x48 0x00 w)

done

#echo "$hexraw"
msb=$(echo ${hexraw:4:2})

lsb=$(echo ${hexraw:2:1})

#echo "0x$msb$lsb"
dec=$(printf "%d\n" "0x$msb$lsb")
echo "scale=4; $dec*0.0625"| bc
