<#
Author: John Requejo
Website: johnrequejo.com
Creation Date: 2025/01/11
Description: This script generates a CSV file containing a list of ports in the "Listen" state from active TCP connections. This CSV can be used as input for the PortChecker.ps1 script.
#>

param (
    [string]$csvPath
)


# If no parameters were provided, display usage information
if (-not $csvPath) {
    Write-Host "Usage: GePortCSVGenerator.ps1 -csvPath <CSV File Path>" -ForegroundColor Yellow
    exit
}

$listenPorts = Get-NetTCPConnection |
    Where-Object { $_.State -eq "Listen" } |
    Select-Object -ExpandProperty LocalPort

$listenPorts | ForEach-Object { 
    [PSCustomObject]@{
        Port = $_
    }
} | Export-Csv -Path $csvPath -NoTypeInformation

Write-Output "CSV file created at: $csvPath"
