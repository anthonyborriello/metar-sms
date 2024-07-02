#!/bin/bash

# METAR SMS Notifier
# Author: Antonio Borriello
# GitHub: https://github.com/anthonyborriello/metar-sms-notifier

# Function to fetch and display METAR for a given airport
get_metar() {
    # Constructing API link with the provided ICAO airport ID
    api_link="https://aviationweather.gov/api/data/metar?ids=$1"

    # Requesting METAR from the API and storing it in the result variable
    result=$(curl -s "$api_link")

    # Displaying the result
    echo "$result"
}

# Function to prompt the user to input the destination number for SMS
ask_destination_number() {
    read -p "Enter the destination number for SMS (e.g., +391234567890): " destination_number
}

# Function to send an SMS using gammu
send_sms() {
    # Attempt to send SMS using gammu and capture both stdout and stderr
    sms_output=$(echo "$1" | sudo gammu sendsms TEXT "$2" 2>&1)

    # Check if there were any errors reported
    if [[ "$sms_output" == *"Error opening device"* || "$sms_output" == *"No response in specified timeout"* ]]; then
        echo "Failed to send SMS: $sms_output"
        return 1
    fi

    # Check if message reference is obtained, indicating successful sending
    if [[ "$sms_output" == *"OK, message reference"* ]]; then
        return 0
    fi

    echo "Failed to send SMS: $sms_output"
    return 1
}

# Main script logic
main() {
    # User input for the ICAO airport code
    read -p "Enter the ICAO code of the airport (4 letters): " icao_code

    # Calling the function to get METAR for the entered airport
    metar_output=$(get_metar "$icao_code")

    # Checking if METAR output was obtained successfully
    if [ -n "$metar_output" ]; then
        # Asking the user to input the destination number for SMS
        ask_destination_number

        # Sending the METAR output via SMS using gammu
        if send_sms "$metar_output" "$destination_number"; then
            echo "METAR output sent successfully via SMS."
        else
            echo "Failed to send METAR output via SMS."
        fi
    else
        echo "Error: Unable to fetch METAR output for the specified ICAO code."
    fi
}

# Execute the main function
main
