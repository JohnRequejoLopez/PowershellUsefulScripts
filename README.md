# PowerShell Scripts for Incident Response 🚀

## Overview

This repository contains a collection of useful PowerShell scripts designed to assist with **Incident Response (IR)** tasks. These scripts help security teams quickly gather relevant information for investigation and troubleshooting.

## Scripts Index

### [1. **TCPListenerProcessMap.ps1**](https://github.com/JohnRequejoLopez/PowershellUsefulScripts/tree/main/TCPListener)
   **Description:** Retrieves all TCP connections in the "Listen" state and maps each listening port to its corresponding process name. Useful for identifying which processes are listening on specific ports.  
   
   **Usage:**  
   ```powershell
   .\TCPListenerProcessMap.ps1
   ```

### [2. **PasswordLastSetRetriever.ps1**](https://github.com/JohnRequejoLopez/PowershellUsefulScripts/tree/main/PasswordLastSet)
   **Description:** Retrieves the "PasswordLastSet" date for a specified Active Directory user and saves the output to a file. Helps in checking when a user last updated their password.
   
   **Usage:**
   ```powershell
   .\PasswordLastSetRetriever.ps1 -Username "targetUser" -outputFile "C:\temp\PasswordLastSet.txt"
   ```
## Author

John Requejo

## Creation Date 

2025/03/14

## License

This project is open source under the [MIT License](https://opensource.org/licenses/MIT).


## Contributions

Contributions are welcome! Feel free to fork the repository and submit pull requests to improve or add new scripts.