#!/bin/bash

################################################################################
#                        SIMPLE INTEREST CALCULATOR                           #
#                                                                              #
# Description: This script calculates simple interest based on user input     #
#              for principal amount, rate of interest, and time period        #
#                                                                              #
# Formula: SI = (P × R × T) / 100                                            #
#          Where: P = Principal, R = Rate, T = Time                          #
#                                                                              #
# Author: Simple Interest Calculator Project                                  #
# Version: 1.0                                                                #
# License: Apache 2.0                                                         #
################################################################################

# Color codes for output (optional, for better visualization)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

################################################################################
# Function to display header
################################################################################
display_header() {
    echo ""
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}  SIMPLE INTEREST CALCULATOR${NC}"
    echo -e "${BLUE}================================${NC}"
    echo ""
}

################################################################################
# Function to validate numeric input
# Arguments: $1 = user input, $2 = field name
# Returns: 0 if valid, 1 if invalid
################################################################################
validate_input() {
    local input=$1
    local field_name=$2
    
    # Check if input is empty
    if [ -z "$input" ]; then
        echo -e "${RED}Error: $field_name cannot be empty.${NC}"
        return 1
    fi
    
    # Check if input is a valid number (integer or decimal)
    if ! [[ "$input" =~ ^[0-9]+\.?[0-9]*$ ]] || [[ "$input" == "." ]]; then
        echo -e "${RED}Error: $field_name must be a valid number.${NC}"
        return 1
    fi
    
    # Check if input is positive
    if (( $(echo "$input <= 0" | bc -l) )); then
        echo -e "${RED}Error: $field_name must be greater than 0.${NC}"
        return 1
    fi
    
    return 0
}

################################################################################
# Function to get principal amount from user
################################################################################
get_principal() {
    local principal
    
    while true; do
        read -p "Enter the Principal Amount: " principal
        
        if validate_input "$principal" "Principal Amount"; then
            echo "$principal"
            return 0
        fi
    done
}

################################################################################
# Function to get rate of interest from user
################################################################################
get_rate() {
    local rate
    
    while true; do
        read -p "Enter the Rate of Interest (per annum %): " rate
        
        if validate_input "$rate" "Rate of Interest"; then
            echo "$rate"
            return 0
        fi
    done
}

################################################################################
# Function to get time period from user
################################################################################
get_time() {
    local time
    
    while true; do
        read -p "Enter the Time Period (in years): " time
        
        if validate_input "$time" "Time Period"; then
            echo "$time"
            return 0
        fi
    done
}

################################################################################
# Function to calculate simple interest
# Arguments: $1 = principal, $2 = rate, $3 = time
# Returns: simple interest value
################################################################################
calculate_simple_interest() {
    local principal=$1
    local rate=$2
    local time=$3
    
    # Formula: SI = (P × R × T) / 100
    local simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
    
    echo "$simple_interest"
}

################################################################################
# Function to calculate total amount
# Arguments: $1 = principal, $2 = simple interest
# Returns: total amount (principal + interest)
################################################################################
calculate_total_amount() {
    local principal=$1
    local simple_interest=$2
    
    local total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)
    
    echo "$total_amount"
}

################################################################################
# Function to display results
# Arguments: $1 = principal, $2 = rate, $3 = time, 
#            $4 = simple_interest, $5 = total_amount
################################################################################
display_results() {
    local principal=$1
    local rate=$2
    local time=$3
    local simple_interest=$4
    local total_amount=$5
    
    echo ""
    echo -e "${GREEN}====================================${NC}"
    echo -e "${GREEN}Simple Interest Calculation Results${NC}"
    echo -e "${GREEN}====================================${NC}"
    echo -e "${YELLOW}Principal Amount:${NC}       $principal"
    echo -e "${YELLOW}Rate of Interest:${NC}      $rate% per annum"
    echo -e "${YELLOW}Time Period:${NC}           $time years"
    echo -e "${GREEN}-----------------------------------${NC}"
    echo -e "${YELLOW}Simple Interest:${NC}       $simple_interest"
    echo -e "${YELLOW}Total Amount:${NC}          $total_amount"
    echo -e "${GREEN}====================================${NC}"
    echo ""
}

################################################################################
# Function to ask if user wants to calculate again
# Returns: 0 for yes, 1 for no
################################################################################
calculate_again() {
    local choice
    
    read -p "Do you want to calculate simple interest again? (yes/no): " choice
    
    case "$choice" in
        yes|Yes|YES|y|Y)
            return 0
            ;;
        no|No|NO|n|N)
            return 1
            ;;
        *)
            echo -e "${RED}Invalid choice. Please enter 'yes' or 'no'.${NC}"
            calculate_again
            ;;
    esac
}

################################################################################
# Function to display closing message
################################################################################
display_closing() {
    echo ""
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}Thank you for using${NC}"
    echo -e "${BLUE}Simple Interest Calculator!${NC}"
    echo -e "${BLUE}================================${NC}"
    echo ""
}

################################################################################
# Main program execution
################################################################################
main() {
    display_header
    
    # Main loop for multiple calculations
    while true; do
        # Get user inputs with validation
        principal=$(get_principal)
        rate=$(get_rate)
        time=$(get_time)
        
        # Calculate simple interest and total amount
        simple_interest=$(calculate_simple_interest "$principal" "$rate" "$time")
        total_amount=$(calculate_total_amount "$principal" "$simple_interest")
        
        # Display the results
        display_results "$principal" "$rate" "$time" "$simple_interest" "$total_amount"
        
        # Ask if user wants to calculate again
        if ! calculate_again; then
            break
        fi
        
        echo ""
    done
    
    # Display closing message
    display_closing
}

# Run the main program
main
