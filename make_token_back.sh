#!/bin/sh

cat ./access.txt | grep -A 9 knowlive_test  | sed -e "1,3d" | grep -B 10 > ./proto_token.txt
sed -e '$d' ./proto_token.txt | awk '{print $1}' | tr -d '\r' |tr -d '\n' > ./token.txt

