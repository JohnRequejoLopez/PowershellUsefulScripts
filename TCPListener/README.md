# TCPListenerProcessMap and PortCSVGenerator

## Overview

[**TCPListenerProcessMap**](https://github.com/JohnRequejoLopez/PowershellUsefulScripts/blob/main/TCPListener/TCPListenerProcessMap.ps1) is a PowerShell script that retrieves all TCP connections in the "Listen" state and maps each listening port to its corresponding process name. It outputs a formatted table displaying the local address, local port, owning process ID, and process name.

[**PortCSVGenerator**](https://github.com/JohnRequejoLopez/PowershellUsefulScripts/blob/main/TCPListener/PortCSVGenerator.ps1) is a PowerShell script that generates a CSV file containing a list of ports in the "Listen" state from active TCP connections. This CSV can be used as input for the `PortChecker.ps1` script to check whether those ports are open or closed on a given public IP address.

## Prerequisites

- Windows PowerShell 5.1+ or PowerShell Core
- Administrative privileges may be required to retrieve network and process information.

## Usage

### [TCPListenerProcessMap](https://github.com/JohnRequejoLopez/PowershellUsefulScripts/blob/main/TCPListener/TCPListenerProcessMap.ps1)

1. **Download the script:**  
   Clone the repository or download `TCPListenerProcessMap.ps1`.

2. **Open PowerShell:**  
   Run PowerShell as Administrator.

3. **Execute the script:**  
   Navigate to the script's directory and run:

   ```powershell
   .\TCPListenerProcessMap.ps1
   ```
   
4. **View results:**
   The script outputs a table with the TCP listening details.

### [PortCSVGenerator](https://github.com/JohnRequejoLopez/PowershellUsefulScripts/blob/main/TCPListener/PortCSVGenerator.ps1)

1. **Download the script:**  
   Clone the repository or download `PortCSVGenerator.ps1`.

2. **Open PowerShell:**  
   Run PowerShell.

3. **Execute the script:**  
   Navigate to the script's directory and run:

   ```powershell
   .\PortCSVGenerator.ps1 -csvPath "C:\path\to\ports.csv"
   ```
   - Replace "C:\path\to\ports.csv" with the desired path where you want to save the generated CSV file. The script will create a CSV file containing the list of listening ports.

4. **View results:**
   The script outputs a table with the TCP listening details. After executing the script, a CSV file containing the list of ports in the "Listen" state will be created at the specified path. The file will have a column Port with the port numbers.
   -  Example output (CSV):
      ```csv
      80
      443
      3389
      ```
   
5. **Use with PortChecker:**
   
   You can now use the generated CSV file as input for the [PortScanner](https://github.com/JohnRequejoLopez/PowershellUsefulScripts/blob/main/PortScanner) script to check the accessibility of the listed ports from another asset.

## Author

John Requejo

## Creation Date 

2025/03/14

## License

This project is open source under the [MIT License](https://opensource.org/licenses/MIT).


## Contributing

Contributions are welcome! Feel free to fork this repository and submit pull requests.