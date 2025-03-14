<#
Author: John Requejo
Website: johnrequejo.com
Creation Date: 2025/02/18
Description: This script  retrieves the 'PasswordLastSet' date for a specified Active Directory user. It outputs the formatted date to a given file, ensuring that the destination directory exists before writing. If the date is not found or an error occurs, a corresponding message is written to the file.
#>

param (
    [string]$Username,
	[string]$outputFile
)

# Ensure the directory exists
if (-not (Test-Path "C:\temp")) {
    New-Item -Path "C:\" -Name "temp" -ItemType Directory
}

# Clear the content of the file if it exists (starts fresh)
Clear-Content -Path $outputFile -ErrorAction SilentlyContinue

# Try to get the user's PasswordLastSet date
try {
    $passwordLastSet = (Get-ADUser -Identity $Username -Properties PasswordLastSet).PasswordLastSet

    # Check if we have a valid PasswordLastSet value
    if ($passwordLastSet) {
        $passwordLastSetFormatted = $passwordLastSet.ToString('yyyy-MM-dd HH:mm:ss')
        "$passwordLastSetFormatted" | Out-File -FilePath $outputFile -Append
    } else {
        "Password last set date not found for $Username." | Out-File -FilePath $outputFile -Append
    }
}
catch {
    "Error retrieving user information: $_" | Out-File -FilePath $outputFile -Append
}