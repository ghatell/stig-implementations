<#
.SYNOPSIS
    Disables Basic authentication for the WinRM client by setting AllowBasic to 0.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-02
    Last Modified   : 2025-04-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000330

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Disables insecure Basic authentication for WinRM client communications to comply with DoD STIG WN10-CC-000330.

.USAGE
    PS C:\> .\Disable-WinRMClientBasicAuth.ps1
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set AllowBasic to 0
Set-ItemProperty -Path $regPath -Name "AllowBasic" -Value 0 -Type DWord

# Confirm the change
$currentValue = Get-ItemProperty -Path $regPath -Name "AllowBasic"
Write-Output "AllowBasic successfully set to: $($currentValue.AllowBasic)"
