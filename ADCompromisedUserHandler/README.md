# HandleCompromisedUser

## Overview

HandleCompromisedUser is a PowerShell script designed to assist in incident response by taking immediate actions on compromised Active Directory (AD) user accounts. This script provides functionality to:

- Disable a compromised user account.
- Reset the user's password.
- Force log off all active sessions.
- Delete a malicious user account.

These actions help security teams quickly contain threats and prevent further compromise in an AD environment.

## Prerequisites

- Windows PowerShell 5.1+ or PowerShell Core  
- Active Directory module for Windows PowerShell  
- Administrative privileges to modify AD accounts  

## Usage

1. **Download the script:**  
   Clone the repository or download the `HandleCompromisedUser.ps1` file.

2. **Open PowerShell:**  
   Run PowerShell as Administrator.

3. **Execute the script:**  
   Navigate to the script's directory and run it with the required parameters:

   ```powershell
   .\HandleCompromisedUser.ps1 -UserName "compromisedUser" -DisableAccount
   ````

   - Available options:
      - Disable a compromised account:
          ```powershell
        .\HandleCompromisedUser.ps1 -UserName "compromisedUser" -DisableAccount
          ```
      - Reset the user's password:
          ```powershell
        .\HandleCompromisedUser.ps1 -UserName "compromisedUser" -ResetPassword -NewPassword "NewSecureP@ssword123"
          ````
      - Force log off all active sessions:
          ```powershell
        .\HandleCompromisedUser.ps1 -UserName "compromisedUser" -LogoffSessions
          ````
      - Delete a malicious user account:
          ```powershell
        .\HandleCompromisedUser.ps1 -UserName "maliciousUser" -DeleteUser
          ````

## Author

John Requejo

## Creation Date 

2025/02/18

## License

This project is open source under the [MIT License](https://opensource.org/licenses/MIT).


## Contributing

Contributions are welcome! Feel free to fork this repository and submit pull requests.

