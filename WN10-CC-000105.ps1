<#
.SYNOPSIS
    Disables web-based services in File Explorer by setting NoWebServices to 1.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-02
    Last Modified   : 2025-04-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000105
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Enforces the STIG requirement to disable web services in File Explorer, preventing the system from retrieving data like Windows Media info from the internet.

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-CC-000105.ps1
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"

# Create registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set NoWebServices to 1
Set-ItemProperty -Path $regPath -Name "NoWebServices" -Value 1 -Type DWord

# Confirm the setting
$currentValue = Get-ItemProperty -Path $regPath -Name "NoWebServices"
Write-Output "NoWebServices successfully set to: $($currentValue.NoWebServices)"
