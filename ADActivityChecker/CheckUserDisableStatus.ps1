<#
Author: John Requejo
Website: johnrequejo.com
Creation Date: 2025/04/16
Description: Checks if the specified Active Directory user account is disabled and logs the result.
#>

param (
    [string]$UserName,
    [string]$ReportPath
)

# Validate that a username and report path are provided
if (-not $UserName -or -not $ReportPath) {
    Write-Output "Usage: .\CheckUserDisabledStatus.ps1 -UserName username -ReportPath C:\tmp\report.txt" -ForegroundColor Red
    exit
}

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

Write-Output "Checking if user '$UserName' is disabled in Active Directory..." -ForegroundColor Yellow
"===== Disabled Status Check for: $UserName =====" | Out-File $ReportPath -Append
"Timestamp: $timestamp" | Out-File $ReportPath -Append

# Ensure the Active Directory module is available
if (-not (Get-Module -ListAvailable -Name ActiveDirectory)) {
    Write-Output "ActiveDirectory module not found. Please install RSAT tools." -ForegroundColor Red
    "Error: ActiveDirectory module not found." | Out-File $ReportPath -Append
    exit
}

Import-Module ActiveDirectory

try {
    $user = Get-ADUser -Identity $UserName -Properties Enabled
    $status = if ($user.Enabled) { "Enabled" } else { "Disabled" }

    Write-Output "Account Status: $status" -ForegroundColor Green
    "Account Status: $status" | Out-File $ReportPath -Append
}
catch {
    Write-Output "Error retrieving user '$UserName': $_" -ForegroundColor Red
    "Error: $_" | Out-File $ReportPath -Append
}

Write-Output "Report generated: $ReportPath" -ForegroundColor Cyan