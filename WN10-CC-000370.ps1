<#
.SYNOPSIS
    This PowerShell script disables domain user PIN sign-in by setting the AllowDomainPINLogon registry value to 0.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-01
    Last Modified   : 2025-04-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000370

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-CC-000370.ps1
#>

# Define the registry path
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\System"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set AllowDomainPINLogon to 0
Set-ItemProperty -Path $regPath -Name "AllowDomainPINLogon" -Value 0 -Type DWord

# Confirm the change
$currentValue = Get-ItemProperty -Path $regPath -Name "AllowDomainPINLogon"
Write-Output "AllowDomainPINLogon successfully set to: $($currentValue.AllowDomainPINLogon)"
