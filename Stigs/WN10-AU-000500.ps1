<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Randy Jenkins
    LinkedIn        : linkedin.com/in/randy-jenkins-886a22103/
    GitHub          : https://github.com/randyjenkins216
    Date Created    : 2025-02-05
    Last Modified   : 2025-02-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 2025-02-05
    Tested By       : Randy Jenkins
    Systems Tested  : rox-threatlab-1
    PowerShell Ver. : 

.USAGE
 


# YOUR CODE GOES HERE

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$registryName = "MaxSize"
$registryValue = 0x00008000

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry key value
Set-ItemProperty -Path $registryPath -Name $registryName -Value $registryValue

Write-Host "Registry key updated successfully!"
