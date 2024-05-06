#!/bin/bash

# METAR SMS Notifier
# Author: [Il tuo nome e cognome]
# GitHub: [Il link al tuo profilo GitHub]

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
    echo "$1" | sudo gammu sendsms TEXT "$2"
}

# User input for the ICAO airport code
read -p "Enter the ICAO code of the airport (4 letters): " icao_code

# Calling the function to get METAR for the entered airport
metar_output=$(get_metar "$icao_code")

# Checking if METAR output was obtained successfully
if [ -n "$metar_output" ]; then
    # Asking the user to input the destination number for SMS
    ask_destination_number

    # Sending the METAR output via SMS using gammu
    send_sms "$metar_output" "$destination_number"
    echo "METAR output sent successfully via SMS."
else
    echo "Error: Unable to fetch METAR output for the specified ICAO code."
fi
