<#
.SYNOPSIS
    Ensures that exception chain validation is enabled by setting DisableExceptionChainValidation to 0.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-02
    Last Modified   : 2025-04-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000150

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Configures the system to validate exception chains during kernel-mode stack unwinding, which can help prevent security bypasses.

.USAGE
    PS C:\> .\Enable-ExceptionChainValidation.ps1
#>

# Define the registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set DisableExceptionChainValidation to 0
Set-ItemProperty -Path $regPath -Name "DisableExceptionChainValidation" -Value 0 -Type DWord

# Confirm the change
$currentValue = Get-ItemProperty -Path $regPath -Name "DisableExceptionChainValidation"
Write-Output "DisableExceptionChainValidation successfully set to: $($currentValue.DisableExceptionChainValidation)"
