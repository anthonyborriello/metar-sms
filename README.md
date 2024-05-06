# METAR SMS Notifier

This Bash script allows users to fetch METAR (Meteorological Aerodrome Report) data for a given airport using its ICAO code and send the result via SMS.

## Usage

1. **Clone or Download the Repository**: Click the green "Code" button and select "Download ZIP" to download the repository as a ZIP file. Extract the contents to a folder on your computer.

   Alternatively, you can copy and paste the following commands into your terminal to download the script directly:

   ```bash
   curl -O https://raw.githubusercontent.com/anthonyborriello/metar-sms/main/metar_sms.sh

2. **Install gammu**: Make sure you have [gammu](https://wammu.eu/gammu/) installed and configured for sending SMS.

3. **Run the Script**:
   - **Linux/Raspberry Pi**: Open Terminal and navigate to the folder where you extracted the repository. Then, execute the following commands to make the script executable and run it:
     ```
     chmod +x metar_sms.sh
     bash metar_sms.sh
     ```
     Youu may need to install gammu first.
     ```
     sudo apt install gammu
     ```

4. **Follow the Prompts**: The script will prompt you to input the ICAO code of the airport and the destination phone number for SMS. Follow the prompts to enter the required information.

## Acknowledgements

Thanks to [aviationweather.gov](https://aviationweather.gov/) for providing the METAR data used in this script.

## License

This script is licensed under the [MIT License](LICENSE).

![metar_sms sh](https://github.com/anthonyborriello/metar-sms/assets/57049017/b560f02b-7dc0-4765-b101-e237f7276d6b)

![IMG_5447](https://github.com/anthonyborriello/metar-sms/assets/57049017/37f56c43-45c0-4934-9c62-8aa17408e1c4)


