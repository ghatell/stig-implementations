<#
.SYNOPSIS
    This PowerShell script sets the Windows telemetry level to Security (0) by configuring the AllowTelemetry registry value.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-03-31
    Last Modified   : 2025-03-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000205

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-CC-000205.ps1
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set AllowTelemetry to 0 (Security)
Set-ItemProperty -Path $regPath -Name "AllowTelemetry" -Value 0 -Type DWord

# Confirm the change
$currentValue = Get-ItemProperty -Path $regPath -Name "AllowTelemetry"
Write-Output "AllowTelemetry successfully set to: $($currentValue.AllowTelemetry)"
