#!/usr/bin/bash
# This bash srcript is for making cast accounts
clear

# Colors
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export WHITE='\033[0;37m'
export NC='\033[0m' # No Color

# --- Global Variables  ---

contracts=(
    "0xA465600233997C758744d21ec8Bd0F5E84340e19"
)

ETHERSCAN_API_KEY="2JEANQYC4C9S6PKDFWNGVT2UER24T32D2M"

# Network Configurations (Format: "NetworkName:RPC_URL")
networks=(
    "https://eth-holesky.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx"
    "https://eth-sepolia.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx"
)

# Commands

hea1() {
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
}

# Actual cast intefcae function

cast_int() {
    h1 "Using cast interface to get the interface of a deployed contract"

    local contract_address="${contracts[0]}"
    local rpc_url="${networks[0]}"   # Using first network (Sepolia in your case)
    local output_file="ICounter.sol" # Output filename

    echo -e "${YELLOW}Fetching interface for contract:${NC} $contract_address"
    echo -e "${YELLOW}Using RPC URL:${NC} $rpc_url"

    # Run cast interface command
    cast interface "$contract_address" \
        --rpc-url "$rpc_url" >"$output_file"

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Interface successfully saved to: $output_file${NC}"
        echo -e "${CYAN}--- Interface Content ---${NC}"
        cat "$output_file"
        echo -e "${CYAN}-------------------------${NC}"
    else
        echo -e "${RED}❌ Failed to fetch contract interface.${NC}"
        echo -e "${RED}Make sure the contract is deployed and RPC URL is correct.${NC}"
    fi
}

# Execute Functions
cast_int
