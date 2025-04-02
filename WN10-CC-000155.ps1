<#
.SYNOPSIS
    Disables Remote Assistance by setting the fAllowToGetHelp registry value to 0.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-02
    Last Modified   : 2025-04-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000155

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Enforces the STIG requirement by disabling Remote Assistance, preventing remote help sessions from being initiated or received.

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-CC-000155.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set fAllowToGetHelp to 0 (disable Remote Assistance)
Set-ItemProperty -Path $regPath -Name "fAllowToGetHelp" -Value 0 -Type DWord

# Confirm the setting
$currentValue = Get-ItemProperty -Path $regPath -Name "fAllowToGetHelp"
Write-Output "fAllowToGetHelp successfully set to: $($currentValue.fAllowToGetHelp)"
