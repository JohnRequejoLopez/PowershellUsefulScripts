# AD Activity Checker

## Overview

The `ADActivityChecker` module contains PowerShell scripts designed to assist system administrators and security teams in monitoring and managing user account activities within an Active Directory environment. These scripts facilitate tasks such as auditing user logins and verifying account statuses, which are essential for security incident analysis and compliance requirements.

Included Scripts

- [ChecUserLastActivity.ps1](https://github.com/JohnRequejoLopez/PowershellUsefulScripts/tree/main/ADActivityChecker/CheckUserLastActivity.ps1): Retrieves the last successful logins and failed login attempts for a specified user.
- [CheckUserDisableStatus.ps1]((https://github.com/JohnRequejoLopez/PowershellUsefulScripts/tree/main/ADActivityChecker/CheckUserDisableStatus.ps1)): Verifies wheteher a specified user account in AD is currently disabled.

---
## CheckUserLastActivity.ps1

### Description

This script retrieves the last successful logins and failed login attempts for a given user in an Active Directory environment. It aids security teams in gathering information for potential security incident analysis, enabling the integration of user account activity into the workflow of a `SOAR` analysis.

The script outputs the results to a report file and provides details such as:

- Date and time of the login attempt.
- Source IP address of the login attempt (if available).
- Differentiates between successful logins and failed attempts.

## Prerequisites

- Windows PowerShell 5.1+ or PowerShell Core  
- Administrative privileges to access security event logs  
- Access to the Security event log on the system  

## Usage

1. **Download the script:**  
   Clone the repository or download the `CheckUserLastActivity.ps1` file.

2. **Open PowerShell:**  
   Run PowerShell as Administrator.

3. **Execute the script:**  
   Navigate to the script's directory and run it with the required parameters:

   ```powershell
   .\CheckUserLastActivity.ps1 -UserName "username" -ReportPath "C:\Path\To\Report.txt"
   ```

   - Example:
     ```powershell
     .\CheckUserLastActivity.ps1 -UserName "john.requejo" -ReportPath "C:\Reports\JohnRequejo_ActivityReport.txt"
     ```
     This command will generate a report of the last successful logins and failed login attempts for the user `john.requejo`, and output the results to the specified file.

--- 
## CheckUserDisableStatus.ps1

### Description
This script verifies whether a specified user account in Active Directory is currently disabled or enabled. It aids security teams in gathering information for potential security incident analysis, enabling the integration of user account activity into the workflow of a `SOAR` analysis.

The script outputs the results to a report file and includes:

- Timestamp of the check.
- Account status: Enabled or Disabled.
- Error handling if the user is not found or the Active Directory module is missing.

## Prerequisites

- Windows PowerShell 5.1+ or PowerShell Core  
- Active Directory PowerShell module (`RSAT: Active Directory Tools`)  
- Appropriate permissions to query Active Directory  

## Usage

1. **Download the script:**  
   Clone the repository or download the `CheckUserDisableStatus.ps1` file.

2. **Open PowerShell:**  
   Run PowerShell as Administrator.

3. **Execute the script:**  
   Navigate to the script's directory and run it with the required parameters:

   ```powershell
   .\CheckUserDisableStatus.ps1 -UserName "username" -ReportPath "C:\Path\To\Report.txt"
   ```

   - Example:
     ```powershell
     .\CheckUserDisableStatus.ps1 -UserName "john.requejo" -ReportPath "C:\Reports\JohnRequejo_StatusCheck.txt"
     ```
     This command will check whether the account for `john.requejo` is enabled or disabled in Active Directory, writing the results to the specified file.

---

## Author

John Requejo

## Creation Dates

- CheckUserLastActivity.ps1: 2025/02/18
- CheckUserDisableStatus.ps1: 2025/04/16

## License

This project is open source under the [MIT License](https://opensource.org/licenses/MIT).


## Contributing

Contributions are welcome! Feel free to fork this repository and submit pull requests.