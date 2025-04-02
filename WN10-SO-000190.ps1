<#
.SYNOPSIS
    Configures supported Kerberos encryption types by setting SupportedEncryptionTypes to 2147483640.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-02
    Last Modified   : 2025-04-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000190

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Enforces the STIG requirement to use only strong encryption types in Kerberos by setting SupportedEncryptionTypes to 0x7ffffff8 (2147483640).

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-SO-000190.ps1
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set SupportedEncryptionTypes to 0x7ffffff8
Set-ItemProperty -Path $regPath -Name "SupportedEncryptionTypes" -Value 0x7ffffff8 -Type DWord

# Confirm the setting
$currentValue = Get-ItemProperty -Path $regPath -Name "SupportedEncryptionTypes"
Write-Output "SupportedEncryptionTypes successfully set to: $($currentValue.SupportedEncryptionTypes)"
