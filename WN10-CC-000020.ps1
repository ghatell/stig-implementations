<#
.SYNOPSIS
    Disables IPv6 source routing by setting DisableIpSourceRouting to 2.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-03
    Last Modified   : 2025-04-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Enforces STIG requirement to block IPv6 source-routed packets, which are often used in spoofing and MITM attacks.

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-CC-000020.ps1
#>

# Define registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set DisableIpSourceRouting to 2
Set-ItemProperty -Path $regPath -Name "DisableIpSourceRouting" -Value 2 -Type DWord

# Confirm the setting
$currentValue = Get-ItemProperty -Path $regPath -Name "DisableIpSourceRouting"
Write-Output "DisableIpSourceRouting successfully set to: $($currentValue.DisableIpSourceRouting)"
