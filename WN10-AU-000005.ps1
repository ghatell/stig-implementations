<#
.SYNOPSIS
    This PowerShell script configures auditing for Account Logon - Credential Validation failures using auditpol.exe.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-03-31
    Last Modified   : 2025-03-31
    Version         : 1.0
    STIG-ID         : WN10-AU-000005

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-AU-000005.ps1
#>

# Ensure the policy is set to audit Credential Validation failures
Write-Output "Setting audit policy: Account Logon >> Credential Validation (Failure)..."

# Apply the configuration
auditpol /set /subcategory:"Credential Validation" /failure:enable

# Confirm the applied setting
Write-Output "`n=== Confirmed Audit Policy Setting ==="
auditpol /get /subcategory:"Credential Validation"
