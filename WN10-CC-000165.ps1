<#
.SYNOPSIS
    Configures RestrictRemoteClients to 1 to limit RPC communication to secure and authenticated clients.

.NOTES
    Author          : Soroush Asadi
    LinkedIn        : https://www.linkedin.com/in/soroush-asadi-881098178/
    GitHub          : https://github.com/ghatell
    Date Created    : 2025-04-02
    Last Modified   : 2025-04-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000310

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 5.1

.DESCRIPTION
    Applies the STIG-required setting to restrict remote RPC clients, reducing attack surface by preventing unauthenticated RPC connections.

.USAGE
    PS C:\Users\cyberSentinel_92\Desktop\WN10-CC-000165.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Rpc"

# Create registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $regPath"
}

# Set RestrictRemoteClients to 1
Set-ItemProperty -Path $regPath -Name "RestrictRemoteClients" -Value 1 -Type DWord

# Confirm the setting
$currentValue = Get-ItemProperty -Path $regPath -Name "RestrictRemoteClients"
Write-Output "RestrictRemoteClients successfully set to: $($currentValue.RestrictRemoteClients)"
