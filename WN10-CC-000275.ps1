<#
.SYNOPSIS
    Disables drive redirection in Remote Desktop sessions by setting fDisableCdm to 1.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-02
    Last Modified   : 2025-04-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000295

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Enforces a policy to prevent local drive access within Remote Desktop sessions for added security.

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-CC-000275.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"

# Create registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set fDisableCdm to 1
Set-ItemProperty -Path $regPath -Name "fDisableCdm" -Value 1 -Type DWord

# Confirm the setting
$currentValue = Get-ItemProperty -Path $regPath -Name "fDisableCdm"
Write-Output "fDisableCdm successfully set to: $($currentValue.fDisableCdm)"
