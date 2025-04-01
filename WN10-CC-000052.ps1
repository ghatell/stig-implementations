<#
.SYNOPSIS
    This PowerShell script sets approved ECC curves for TLS by configuring the EccCurves registry value to "NistP384" and "NistP256".

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-01
    Last Modified   : 2025-04-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000052

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-CC-000052.ps1
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set the EccCurves value (REG_MULTI_SZ)
$curves = @("NistP384", "NistP256")
New-ItemProperty -Path $regPath -Name "EccCurves" -PropertyType MultiString -Value $curves -Force | Out-Null

# Confirm the change
$currentValue = Get-ItemProperty -Path $regPath -Name "EccCurves"
Write-Output "EccCurves successfully set to:"
$currentValue.EccCurves
