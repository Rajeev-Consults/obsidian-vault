<#
==============================================================================
Script      : initialize-ekar.ps1

Enterprise : JayaSwara
Capability : EKAR (Enterprise Knowledge Assets Repository)
Framework  : Workflow Monk

Author      : Rajeev

Version     : 1.0.0
Status      : Production
Created     : 16-Jul-2026

Description
-----------
Initializes the complete EKAR folder hierarchy.

Features

• Interactive root folder selection
• Automatic folder creation
• Safe execution confirmation
• Progress reporting
• Execution summary

Future Versions

• Validation
• Inventory
• Backup
• Restore
• Logging
• Statistics
• Zotero Integration

==============================================================================

Copyright (c) JayaSwara

==============================================================================

#>

# ============================================================================
# Version Information
# ============================================================================

$ScriptVersion = "1.0.0"

# ============================================================================
# Default Repository Location
# ============================================================================

$DefaultRoot = "E:\Work\EKAR"

Write-Host ""
Write-Host "==============================================="
Write-Host " EKAR INITIALIZATION"
Write-Host " Enterprise : JayaSwara"
Write-Host " Version    : $ScriptVersion"
Write-Host "==============================================="
Write-Host ""

$Root = Read-Host "Enter EKAR Root Folder (Press Enter for default)"

if ([string]::IsNullOrWhiteSpace($Root))
{
    $Root = $DefaultRoot
}

Write-Host ""
Write-Host "Repository Location:"
Write-Host $Root
Write-Host ""

$Confirm = Read-Host "Proceed? (Y/N)"

if ($Confirm.ToUpper() -ne "Y")
{
    Write-Host ""
    Write-Host "Initialization cancelled."
    exit 1
}

# ============================================================================
# Helper Function
# ============================================================================

function New-EKARFolder
{
    param(
        [string]$Path
    )

    if (!(Test-Path $Path))
    {
        New-Item `
            -ItemType Directory `
            -Path $Path `
            -Force | Out-Null
    }
}
