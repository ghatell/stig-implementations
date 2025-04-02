<#
.SYNOPSIS
    Configures UAC to prompt for consent on the secure desktop for administrators in Admin Approval Mode.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-03
    Last Modified   : 2025-04-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000250

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Enforces UAC setting to ensure elevated privilege prompts for administrators occur on a secure desktop, reducing risk of spoofing attacks.

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-SO-000250.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

# Create registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set ConsentPromptBehaviorAdmin to 2
Set-ItemProperty -Path $regPath -Name "ConsentPromptBehaviorAdmin" -Value 2 -Type DWord

# Confirm the setting
$currentValue = Get-ItemProperty -Path $regPath -Name "ConsentPromptBehaviorAdmin"
Write-Output "ConsentPromptBehaviorAdmin successfully set to: $($currentValue.ConsentPromptBehaviorAdmin)"
