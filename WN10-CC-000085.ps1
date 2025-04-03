<#
.SYNOPSIS
    Configures the Early Launch Anti-Malware (ELAM) driver policy to a compliant value (1, 3, or 8).

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-03
    Last Modified   : 2025-04-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000085

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Sets the Early Launch Anti-Malware (ELAM) DriverLoadPolicy to a secure, STIG-compliant value (default: Good only).

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-CC-000085.ps1
#>

# === CONFIGURABLE VALUE ===
# Valid options: 1 (Good + Unknown), 3 (Good + Unknown + Critical Bad), 8 (Good only)
$driverPolicyValue = 8

# === DO NOT EDIT BELOW THIS LINE ===

# Registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Policies\EarlyLaunch"

# Create key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set DriverLoadPolicy
Set-ItemProperty -Path $regPath -Name "DriverLoadPolicy" -Value $driverPolicyValue -Type DWord

# Confirm the setting
$current = Get-ItemProperty -Path $regPath -Name "DriverLoadPolicy"
Write-Output "DriverLoadPolicy successfully set to: $($current.DriverLoadPolicy)"
