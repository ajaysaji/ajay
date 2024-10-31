#!/bin/bash
domain=$1
mkdir -p output/$domain
echo "start Assetfinder"
assetfinder --subs-only $domain > output/$domain/assetfinders.txt
echo "complete Assetfinder"
echo "started sublister"
sublist3r -d $domain -o output/$domain/sublister.txt
echo " start sorting"
cat output/$domain/assetfinders.txt output/$domain/sublister.txt | sort -u > output/$domain/all-subdomains.txt
echo "finding all live subdomains"
cat output/$domain/all-subdomains.txt | httprobe > output/$domain/live-subdomains.txt
echo "complete"
