<#
Author: John Requejo
Website: johnrequejo.com
Creation Date: 2025/02/18
Description: This script provides containment and mitigation actions for Active Directory incidents.
             It allows disabling compromised accounts, resetting passwords, logging off active sessions,
             and deleting unauthorized users.
#>

param (
    [string]$UserName,         # Target user account (e.g., compromised or malicious)
    [string]$NewPassword,      # New password (only used for resetting passwords)
    [switch]$DisableAccount,   # Flag to disable an account
    [switch]$ResetPassword,    # Flag to reset an account password
    [switch]$LogoffSessions,   # Flag to log off all active sessions
    [switch]$DeleteUser        # Flag to delete a user account
)

# Function to disable a compromised user account
function Disable-CompromisedUser {
    param ([string]$UserName)
    try {
        Disable-ADAccount -Identity $UserName
        Write-Host "✅ The account '$UserName' has been disabled." -ForegroundColor Green
    } catch {
        Write-Host "❌ Failed to disable the account '$UserName'. Error: $_" -ForegroundColor Red
    }
}

# Function to reset a user's password
function Reset-UserPassword {
    param ([string]$UserName, [string]$NewPassword)
    try {
        $SecurePassword = ConvertTo-SecureString $NewPassword -AsPlainText -Force
        Set-ADAccountPassword -Identity $UserName -Reset -NewPassword $SecurePassword
        Write-Host "The password for '$UserName' has been reset successfully." -ForegroundColor Green
    } catch {
        Write-Host "Failed to reset the password for '$UserName'. Error: $_" -ForegroundColor Red
    }
}

# Function to log off all active sessions for a user
function Logoff-UserSessions {
    param ([string]$UserName)
    try {
        $Computers = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name
        foreach ($Computer in $Computers) {
            Invoke-Command -ComputerName $Computer -ScriptBlock {
                query user | Select-String -Pattern $using:UserName
                if ($?) { logoff }
            }
        }
        Write-Host "All active sessions for '$UserName' have been logged off." -ForegroundColor Green
    } catch {
        Write-Host "Failed to log off sessions for '$UserName'. Error: $_" -ForegroundColor Red
    }
}

# Function to delete a malicious user account
function Remove-MaliciousUser {
    param ([string]$UserName)
    try {
        Remove-ADUser -Identity $UserName -Confirm:$false
        Write-Host "The user '$UserName' has been deleted successfully." -ForegroundColor Green
    } catch {
        Write-Host "Failed to delete the user '$UserName'. Error: $_" -ForegroundColor Red
    }
}

# Execution logic based on parameters
if ($DisableAccount) { Disable-CompromisedUser -UserName $UserName }
if ($ResetPassword -and $NewPassword) { Reset-UserPassword -UserName $UserName -NewPassword $NewPassword }
if ($LogoffSessions) { Logoff-UserSessions -UserName $UserName }
if ($DeleteUser) { Remove-MaliciousUser -UserName $UserName }

# If no parameters were provided, display usage information
if (-not ($DisableAccount -or $ResetPassword -or $LogoffSessions -or $DeleteUser)) {
    Write-Host "Usage: HandleCompromisedUser.ps1 -UserName <username> [-DisableAccount] [-ResetPassword -NewPassword <password>] [-LogoffSessions] [-DeleteUser]" -ForegroundColor Yellow
}
