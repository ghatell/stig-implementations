<#
.SYNOPSIS
    Disables Basic authentication for WinRM by setting AllowBasic to 0.

.NOTES
    Author          : Soroush Asadi
    GitHub          : https://github.com/ghatell
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    STIG ID         : WN10-CC-000345
    Date Created    : 2025-03-31
    Version         : 1.0

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Enforces the STIG requirement by disabling Basic authentication over WinRM, which transmits credentials in plaintext if not protected by TLS.

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-CC-000345.ps1
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set AllowBasic to 0 (disable Basic authentication)
Set-ItemProperty -Path $regPath -Name "AllowBasic" -Value 0 -Type DWord

# Confirm the change
$currentValue = Get-ItemProperty -Path $regPath -Name "AllowBasic"
Write-Output "AllowBasic successfully set to: $($currentValue.AllowBasic)"
