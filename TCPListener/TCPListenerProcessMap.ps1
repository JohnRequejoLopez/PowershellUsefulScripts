<#
Author: John Requejo
Website: johnrequejo.com
Creation Date: 2025/03/14
Description: This script retrieves all TCP connections in the "Listen" state and adds the corresponding process name based on the process ID. The final output is displayed in a formatted table that includes the Local Address, Local Port, Owning Process ID, and the Process Name.
#>

Get-NetTCPConnection |
    Where-Object { $_.State -eq "Listen" } |
    ForEach-Object {
        try {
            $proc = Get-Process -Id $_.OwningProcess -ErrorAction Stop
            $_ | Add-Member -MemberType NoteProperty -Name ProcessName -Value $proc.ProcessName -Force
        }
        catch {
            $_ | Add-Member -MemberType NoteProperty -Name ProcessName -Value "N/A" -Force
        }
        $_
    } |
    Format-Table -AutoSize LocalAddress, LocalPort, OwningProcess, ProcessName
