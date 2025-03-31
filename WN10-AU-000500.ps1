<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-03-30
    Last Modified   : 2025-03-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\Users\cyberSentinel_92\Desktop\WN10-CC-000005.ps1
#>

 # Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set the MaxSize DWORD value to 0x8000 (32768 in decimal)
Set-ItemProperty -Path $regPath -Name "MaxSize" -Value 0x8000 -Type DWord

# Confirm the change
$currentValue = Get-ItemProperty -Path $regPath -Name "MaxSize"
Write-Output "MaxSize successfully set to: $($currentValue.MaxSize)"
