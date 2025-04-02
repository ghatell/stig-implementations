<#
.SYNOPSIS
    Sets the system inactivity timeout to 15 minutes (900 seconds) to enforce session lock after inactivity.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-02
    Last Modified   : 2025-04-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000070

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Enforces the inactivity timeout required by the DoD STIG to automatically lock the session after a defined period of user inactivity.

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-SO-000070.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

# Define timeout value (900 seconds = 15 minutes)
$timeout = 900

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set the InactivityTimeoutSecs value
Set-ItemProperty -Path $regPath -Name "InactivityTimeoutSecs" -Value $timeout -Type DWord

# Confirm the setting
$currentValue = Get-ItemProperty -Path $regPath -Name "InactivityTimeoutSecs"
Write-Output "InactivityTimeoutSecs successfully set to: $($currentValue.InactivityTimeoutSecs) seconds"
