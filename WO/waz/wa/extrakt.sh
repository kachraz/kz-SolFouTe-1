#!/bin/bash

# Extract Address and Private Key using grep and awk
address=$(echo "$output" | grep '^Address:' | awk '{print $2}')
private_key=$(echo "$output" | grep '^Private Key:' | awk '{print $3}')

# Save to files
echo "$address" >addy.txt
echo "$private_key" >pk.txt

# Optional: Print confirmation
echo "Address saved to: $(pwd)/addy.txt"
echo "Private key saved to: $(pwd)/pk.txt"
