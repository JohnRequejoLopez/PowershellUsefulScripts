# AD Activity Checker

## Overview

[CheckUserLastActivity](https://github.com/JohnRequejoLopez/PowershellUsefulScripts/tree/main/ADActivityChecker/CheckUserLastActivity.ps1) is a PowerShell script designed to retrieve the last successful logins and failed login attempts for a given user in an Active Directory environment. This script helps security teams gather more information for potential security incident analysis, enabling the integration of user account activity into the workflow of a SOAR analysis.

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
     The script will generate a report of the last successful logins and failed login attempts for the user `john.requejo`, and output the results to the specified file.

## Author

John Requejo

## Creation Date 

2025/02/18

## License

This project is open source under the [MIT License](https://opensource.org/licenses/MIT).


## Contributing

Contributions are welcome! Feel free to fork this repository and submit pull requests.