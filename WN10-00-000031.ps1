<#
.SYNOPSIS
    This PowerShell script ensures the TPM PIN requirements for BitLocker are configured correctly, depending on whether BitLocker Network Unlock is used.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-03-31
    Last Modified   : 2025-03-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000031

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-00-000031.ps1
#>

# Toggle this to $true if BitLocker Network Unlock is used
$NetworkUnlock = $false

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

# Define values based on network unlock status
$pinValue = if ($NetworkUnlock) { 2 } else { 1 }

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set the values
Set-ItemProperty -Path $regPath -Name "UseTPMPIN" -Value $pinValue -Type DWord
Set-ItemProperty -Path $regPath -Name "UseTPMKeyPIN" -Value $pinValue -Type DWord

# Confirm the changes
$currentValues = Get-ItemProperty -Path $regPath
Write-Output "UseTPMPIN set to: $($currentValues.UseTPMPIN)"
Write-Output "UseTPMKeyPIN set to: $($currentValues.UseTPMKeyPIN)"
