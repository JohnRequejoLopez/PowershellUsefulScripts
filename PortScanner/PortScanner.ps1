<#
Author: John Requejo
Website: johnrequejo.com
Creation Date: 2025/01/11
Description: 
This script checks the accessibility of a list of ports on a given public IP address.
The ports are read from a CSV file, and the script checks whether each port is open or closed using `Test-NetConnection`.
Parameters:
- publicIP: The public IP address to check.
- csvPath: The path to the CSV file containing the list of ports.
#>

param (
    [string]$publicIP,
    [string]$csvPath
)

# Check if both parameters are provided
if (-not $publicIP) {
    Write-Error "Please provide the public IP as an argument."
    exit
}

if (-not $csvPath) {
    Write-Error "Please provide the path to the CSV file as an argument."
    exit
}

# Check if the CSV file exists
if (-not (Test-Path $csvPath)) {
    Write-Error "The CSV file was not found at the specified path: $csvPath"
    exit
}

# Read the ports from the CSV file
$ports = Import-Csv -Path $csvPath

# Iterate over the ports and check if they are open
foreach ($port in $ports) {
    $portNumber = $port.Port
    $testResult = Test-NetConnection -ComputerName $publicIP -Port $portNumber
    
    if ($testResult.TcpTestSucceeded) {
        Write-Output "Port $portNumber is open on $publicIP."
    } else {
        Write-Output "Port $portNumber is closed on $publicIP."
    }
}
