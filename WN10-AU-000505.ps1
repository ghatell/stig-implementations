<#
.SYNOPSIS
    Sets the maximum size of the Security event log to 1024000 bytes (or greater) as required by STIG ID WN10-AU-000505.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-03
    Last Modified   : 2025-04-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000505

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Ensures the Security event log has a minimum size of 1024000 bytes to retain audit data as per compliance standards.

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-AU-000505.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"

# Minimum required log size (in bytes)
$minSize = 1024000

# Create registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set MaxSize to 1024000
Set-ItemProperty -Path $regPath -Name "MaxSize" -Value $minSize -Type DWord

# Confirm the change
$currentValue = Get-ItemProperty -Path $regPath -Name "MaxSize"
Write-Output "Security Event Log MaxSize successfully set to: $($currentValue.MaxSize) bytes"
