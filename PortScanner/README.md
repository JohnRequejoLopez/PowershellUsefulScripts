# PortScanner

## Overview

**PortScanner** is a PowerShell script that checks whether specific ports are open or closed on a given public IP address. The ports are read from a CSV file, and the script uses `Test-NetConnection` to verify the accessibility of each port. The script outputs the results, indicating whether each port is open or closed.

## Prerequisites

- Windows PowerShell 5.1+ or PowerShell Core
- Administrative privileges may be required for certain network checks

## Usage

1. **Download the script:**  
   Clone the repository or download `PortScanner.ps1`.

2. **Prepare the CSV file:**  
   Create a CSV file containing a list of ports to check. The CSV file should look like this:

   ```csv
   Port
   80
   443
   22
   21
   3389
   ```
3. **Execute the script:**
    ```powershell
    .\PortChecker.ps1 -publicIP "8.8.8.8" -csvPath "C:\path\to\ports.csv"
    ```
   - Replace "8.8.8.8" with the IP address you want to check, and "C:\path\to\ports.csv" with the path to your CSV file.
   
4. **View results:**
   The script will output whether each port listed in the CSV file is open or closed for the given public IP.
   
## Author

John Requejo

## Creation Date 

2025/01/11

## License

This project is open source under the [MIT License](https://opensource.org/licenses/MIT).


## Contributing

Contributions are welcome! Feel free to fork this repository and submit pull requests.