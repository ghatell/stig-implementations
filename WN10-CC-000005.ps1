<#
.SYNOPSIS
    This PowerShell script ensures that the camera access from the lock screen is be disabled.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-03-31
    Last Modified   : 2025-03-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\Users\cyberSentinel_92\Desktop\WN10-CC-000005.ps1
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set the NoLockScreenCamera DWORD value to 1
Set-ItemProperty -Path $regPath -Name "NoLockScreenCamera" -Value 1 -Type DWord

# Confirm the change
$currentValue = Get-ItemProperty -Path $regPath -Name "NoLockScreenCamera"
Write-Output "NoLockScreenCamera successfully set to: $($currentValue.NoLockScreenCamera)"
