#!/bin/sh

cat ./access.txt | grep -A 4 knowlive_test  | sed -e "1,3d" > ./proto_token.txt
#sed -e '$d' ./proto_token.txt | awk '{print $1}' | tr -d '\r' |tr -d '\n' > ./token.txt
cat ./proto_token.txt | awk 'NR==1' > proto_token1.txt
cat ./proto_token.txt | awk 'NR==2' > proto_token2.txt
cut -c 14- proto_token1.txt > token_sub1.txt
cut -c 5- proto_token2.txt > token_sub2.txt
cat token_sub1.txt token_sub2.txt | tr -d '\n' > ./token.txt

