<#
Author: John Requejo
Website: johnrequejo.com
Creation Date: 2025/03/16
Description:  This PowerShell script is designed for network containment during a security incident. It blocks a malicious IP across all domain computers, terminates suspicious sessions, and logs off a specific user if necessary, without duplicating functionality from HandleCompromisedUser.
#>

param (
    [string]$MaliciousIP,      # Malicious IP to block across all computers
    [string]$SuspiciousUser,   # Target user account with suspicious sessions
    [string]$UserToLogoff,     # Target user account to log off
    [switch]$Force             # Flag to force actions during emergency
)

# Function to block a malicious IP on all domain computers
function Block-MaliciousIP {
    
    try {
        $computers = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name
        foreach ($computer in $computers) {
            Invoke-Command -ComputerName $computer -ScriptBlock {
                New-NetFirewallRule -DisplayName "Block Malicious IP" -Direction Inbound -Action Block -RemoteAddress $using:MaliciousIP
                Write-Host "Blocked malicious IP on $($env:COMPUTERNAME)"
            } -Credential (Get-Credential) -ErrorAction Stop
        }
    } catch {
        Write-Warning "Failed to block IP on $computer: $_"
    }
}

# Function to terminate suspicious sessions on all domain computers
function Terminate-SuspiciousSessions {
    
    try {
        $computers = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name
        foreach ($computer in $computers) {
            Invoke-Command -ComputerName $computer -ScriptBlock {
                $sessions = quser /server:$env:COMPUTERNAME 2>$null
                foreach ($session in $sessions) {
                    if ($session -match $using:SuspiciousUser) {
                        logoff ($session.Split(' ')[2]) /server:$env:COMPUTERNAME
                        Write-Host "Terminated session of suspicious user $using:SuspiciousUser on $($env:COMPUTERNAME)"
                    }
                }
            } -Credential (Get-Credential) -ErrorAction Stop
        }
    } catch {
        Write-Warning "Failed to terminate session on $computer: $_"
    }
}

# Function to log off a specific user across all domain computers
function Logoff-SpecificUser {
    
    try {
        $computers = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name
        foreach ($computer in $computers) {
            Invoke-Command -ComputerName $computer -ScriptBlock {
                $sessions = quser /server:$env:COMPUTERNAME 2>$null
                foreach ($session in $sessions) {
                    if ($session -match $using:UserToLogoff) {
                        logoff ($session.Split(' ')[2]) /server:$env:COMPUTERNAME
                        Write-Host "Logged off user $using:UserToLogoff on $($env:COMPUTERNAME)"
                    }
                }
            } -Credential (Get-Credential) -ErrorAction Stop
        }
    } catch {
        Write-Warning "Failed to log off user on $computer: $_"
    }
}

# Execution logic based on parameters
if ($MaliciousIP) { Block-MaliciousIP }
if ($SuspiciousUser) { Terminate-SuspiciousSessions }
if ($UserToLogoff) { Logoff-SpecificUser }

# If no parameters were provided, display usage information
if (-not ($MaliciousIP -or $SuspiciousUser -or $UserToLogoff)) {
    Write-Host "Usage: NetworkContainmentActions.ps1 -MaliciousIP <ip> -SuspiciousUser <user> -UserToLogoff <user> [-Force]" -ForegroundColor Yellow
}