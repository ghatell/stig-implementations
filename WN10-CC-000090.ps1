<#
.SYNOPSIS
    Configures NoGPOListChanges to 0 to allow GPO processing event logs to be recorded.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-02
    Last Modified   : 2025-04-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000090

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Ensures GPO processing events are logged by setting NoGPOListChanges to 0, as required by the DoD STIG.

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-CC-000090.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"

# Create registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set NoGPOListChanges to 0
Set-ItemProperty -Path $regPath -Name "NoGPOListChanges" -Value 0 -Type DWord

# Confirm the setting
$currentValue = Get-ItemProperty -Path $regPath -Name "NoGPOListChanges"
Write-Output "NoGPOListChanges successfully set to: $($currentValue.NoGPOListChanges)"
