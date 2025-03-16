<#
Author: John Requejo
Website: johnrequejo.com
Creation Date: 2025/02/18
Description: This script retrieves the 'PasswordLastSet' date for a specified Active Directory user. 
             It outputs the formatted date to a given file, ensuring that the destination directory 
             exists before writing. If the date is not found or an error occurs, a corresponding 
             message is written to the file.
#>

param (
    [string]$Username,
    [string]$outputFile
)

# If no parameters were provided, display usage information
if (-not $Username -or -not $outputFile) {
    Write-Host "Usage: PasswordLastSetRetriever.ps1 -Username <username> -outputFile <file_path>" -ForegroundColor Yellow
    exit
}

# Ensure the directory exists
$directory = [System.IO.Path]::GetDirectoryName($outputFile)
if (-not (Test-Path $directory)) {
    New-Item -Path $directory -ItemType Directory -Force | Out-Null
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
        Write-Host "Password last set date for '$Username' written to '$outputFile'." -ForegroundColor Green
    } else {
        "Password last set date not found for $Username." | Out-File -FilePath $outputFile -Append
        Write-Host "No password last set date found for '$Username'." -ForegroundColor Yellow
    }
}
catch {
    "Error retrieving user information: $_" | Out-File -FilePath $outputFile -Append
    Write-Host "Error retrieving user information: $_" -ForegroundColor Red
}