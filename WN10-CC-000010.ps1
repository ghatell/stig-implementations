<#
.SYNOPSIS
    Disables the lock screen slideshow feature by setting NoLockScreenSlideshow to 1.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-01
    Last Modified   : 2025-04-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    This script enforces the STIG requirement to disable the lock screen slideshow, enhancing system security by reducing potential for information exposure.

.USAGE
    PS C:\> .\Disable-LockScreenSlideshow.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"

# Create registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set NoLockScreenSlideshow to 1
Set-ItemProperty -Path $regPath -Name "NoLockScreenSlideshow" -Value 1 -Type DWord

# Confirm the setting
$currentValue = Get-ItemProperty -Path $regPath -Name "NoLockScreenSlideshow"
Write-Output "NoLockScreenSlideshow successfully set to: $($currentValue.NoLockScreenSlideshow)"
