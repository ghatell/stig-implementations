<#
.SYNOPSIS
    Configures the EnableUserControl registry setting to 0 to prevent standard users from changing Windows Installer options.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-02
    Last Modified   : 2025-04-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000310

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Enforces the STIG requirement by setting EnableUserControl to 0, which restricts Windows Installer behavior for non-administrative users.

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-CC-000310.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set the EnableUserControl DWORD value to 0
Set-ItemProperty -Path $regPath -Name "EnableUserControl" -Value 0 -Type DWord

# Confirm the change
$currentValue = Get-ItemProperty -Path $regPath -Name "EnableUserControl"
Write-Output "EnableUserControl successfully set to: $($currentValue.EnableUserControl)"
