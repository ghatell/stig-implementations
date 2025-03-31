<#
.SYNOPSIS
    This PowerShell script configures BitLocker group policy settings to ensure UseAdvancedStartup, UseTPMPIN, and UseTPMKeyPIN are set according to security requirements.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-03-31
    Last Modified   : 2025-03-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-IDs        : WN10-00-000031
                      

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-00-000031.ps1
#>

# ======== CONFIGURATION ========
# Set this to $true if BitLocker Network Unlock is in use
$NetworkUnlock = $false

# Registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

# Determine values for TPM PIN based on Network Unlock
$pinValue = if ($NetworkUnlock) { 2 } else { 1 }

# ======== EXECUTION ========

# Create registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set UseAdvancedStartup = 1
Set-ItemProperty -Path $regPath -Name "UseAdvancedStartup" -Value 1 -Type DWord
Write-Output "UseAdvancedStartup set to: 1"

# Set TPM PIN policies
Set-ItemProperty -Path $regPath -Name "UseTPMPIN" -Value $pinValue -Type DWord
Write-Output "UseTPMPIN set to: $pinValue"

Set-ItemProperty -Path $regPath -Name "UseTPMKeyPIN" -Value $pinValue -Type DWord
Write-Output "UseTPMKeyPIN set to: $pinValue"

# ======== CONFIRMATION ========
$current = Get-ItemProperty -Path $regPath
Write-Output "`n=== Current Policy Values ==="
Write-Output "UseAdvancedStartup: $($current.UseAdvancedStartup)"
Write-Output "UseTPMPIN: $($current.UseTPMPIN)"
Write-Output "UseTPMKeyPIN: $($current.UseTPMKeyPIN)"

