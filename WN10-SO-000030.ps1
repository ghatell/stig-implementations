<#
.SYNOPSIS
    This PowerShell script enforces Advanced Audit Policy Configuration by setting SCENoApplyLegacyAuditPolicy to 1.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-01
    Last Modified   : 2025-04-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-SO-000030.ps1
#>

# Define the registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set SCENoApplyLegacyAuditPolicy to 1
Set-ItemProperty -Path $regPath -Name "SCENoApplyLegacyAuditPolicy" -Value 1 -Type DWord

# Confirm the change
$currentValue = Get-ItemProperty -Path $regPath -Name "SCENoApplyLegacyAuditPolicy"
Write-Output "SCENoApplyLegacyAuditPolicy successfully set to: $($currentValue.SCENoApplyLegacyAuditPolicy)"
