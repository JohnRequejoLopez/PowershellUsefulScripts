# NetworkContainmentActions

## Overview

**NetworkContainmentActions** is a PowerShell script designed to assist in network containment during security incidents. This script provides functionality to:

- Block a malicious IP address across all domain computers.
- Terminate suspicious user sessions on all domain computers.
- Log off a specific user across all domain computers.

These actions help security teams mitigate threats, prevent lateral movement, and contain compromised users or malicious activities in the network.

## Prerequisites

- Windows PowerShell 5.1+ or PowerShell Core  
- Active Directory module for Windows PowerShell  
- Administrative privileges to modify AD accounts and execute commands on remote machines

## Usage

1. **Download the script:**  
   Clone the repository or download the `NetworkContainmentActions.ps1` file.

2. **Open PowerShell:**  
   Run PowerShell as Administrator.

3. **Execute the script:**  
   Navigate to the script's directory and run it with the required parameters:

   ```powershell
   .\NetworkContainmentActions.ps1 -MaliciousIP "maliciousIP"
   ```

   - Available options:
      - Block a malicious IP across all domain computers:
          ```powershell
        .\NetworkContainmentActions.ps1 -MaliciousIP "maliciousIP"
          ```
      - Terminate suspicious user sessions on all domain computers:
          ```powershell
        .\NetworkContainmentActions.ps1 -SuspiciousUser "suspiciousUser"
          ````
      - Log off a specific user from all domain computers:
          ```powershell
        .\NetworkContainmentActions.ps1 -UserToLogoff "compromisedUser"
          ````

## Author

John Requejo

## Creation Date 

2025/03/16

## License

This project is open source under the [MIT License](https://opensource.org/licenses/MIT).


## Contributing

Contributions are welcome! Feel free to fork this repository and submit pull requests.

