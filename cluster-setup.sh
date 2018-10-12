#!/bin/bash

read -p "Enter the number of machines in the cluster: " vm_num

for i in {1..${vm_num}}; do
	read -p "Enter the IP address of machine №${i}: " IP_array[${i}]
done
