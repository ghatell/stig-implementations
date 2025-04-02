<#
.SYNOPSIS
    Blocks simultaneous connection to non-domain networks when connected to a domain by setting fBlockNonDomain to 1.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-02
    Last Modified   : 2025-04-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000060

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Enforces a security control to prevent network bridging between trusted (domain) and untrusted (non-domain) networks using multiple network interfaces.

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-CC-000060.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set fBlockNonDomain to 1
Set-ItemProperty -Path $regPath -Name "fBlockNonDomain" -Value 1 -Type DWord

# Confirm the setting
$currentValue = Get-ItemProperty -Path $regPath -Name "fBlockNonDomain"
Write-Output "fBlockNonDomain successfully set to: $($currentValue.fBlockNonDomain)"
