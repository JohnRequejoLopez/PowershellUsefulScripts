<#
Author: John Requejo
Website: johnrequejo.com
Creation Date: 2025/02/18
Description: Retrieves the last successful logins and failed login attempts for a given user.
#>

param (
    [string]$UserName,
    [string]$ReportPath
)

# Validate that a username and report path are provided
if (-not $UserName -or -not $ReportPath) {
    Write-Host "Usage: .\CheckUserLastActivity.ps1 -UserName username -ReportPath C:\tmp\report.txt" -ForegroundColor Red
    exit
}

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Function to retrieve login events
function Get-LogonEvents {
    param ([string]$EventID, [string]$EventType)
    
    Write-Host "Retrieving $EventType for user: $UserName..." -ForegroundColor Yellow
    "===== $EventType for: $UserName =====" | Out-File $ReportPath -Append
    "Timestamp: $timestamp" | Out-File $ReportPath -Append
    
    $events = Get-WinEvent -LogName Security -FilterHashtable @{Id=$EventID} -MaxEvents 50 |
              Where-Object { $_.Message -match $UserName }

    if (-not $events) {
        Write-Host "No $EventType found for user $UserName." -ForegroundColor Red
        "No $EventType found." | Out-File $ReportPath -Append
        return
    }
    
    foreach ($event in $events) {
        $date = $event.TimeCreated
        $message = $event.Message -split "`n" | Where-Object { $_ -match "Source Network Address" }
        $sourceIP = if ($message) { $message -replace ".*: \s", "" } else { "Not available" }
        
        $logEntry = "Date: $date - Source IP: $sourceIP"
        Write-Host $logEntry -ForegroundColor Green
        $logEntry | Out-File $ReportPath -Append
    }
}

# Retrieve successful logins
Get-LogonEvents -EventID 4624 -EventType "Successful Logins"

# Retrieve failed login attempts
Get-LogonEvents -EventID 4625 -EventType "Failed Login Attempts"

Write-Host "Report generated: $ReportPath" -ForegroundColor Cyan