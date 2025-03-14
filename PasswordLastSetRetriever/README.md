# PasswordLastSetRetriever

## Overview

PasswordLastSetRetriever is a PowerShell script designed to retrieve the 'PasswordLastSet' date for a specified Active Directory user. It outputs the formatted date to a given file, ensuring that the destination directory exists before writing. If the date is not found or an error occurs, a corresponding message is written to the file.

## Prerequisites

- Windows PowerShell 5.1+ or PowerShell Core
- Active Directory module for Windows PowerShell
- Administrative privileges may be required to access AD user details

## Usage

1. **Download the script:**  
   Clone the repository or download the `PasswordLastSetRetriever.ps1` file.

2. **Open PowerShell:**  
   Run PowerShell as Administrator.

3. **Execute the script:**  
   Navigate to the script's directory and run it with the required parameters:
   
   ```powershell
   .\PasswordLastSetRetriever.ps1 -Username "targetUser" -outputFile "C:\temp\PasswordLastSet.txt"
   ```
   - Replace "targetUser" with the actual username.
   - Replace the output file path if desired.
4. **Check the output:**
Open the specified output file to view the formatted 'PasswordLastSet' date or any error messages.


## Author

John Requejo

## Creation Date 

2025/02/18

## License

This project is open source under the [MIT License](https://opensource.org/licenses/MIT).


## Contributing

Contributions are welcome! Feel free to fork this repository and submit pull requests.
