<#
==============================================================================
Module 1
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

#==============================================================================
# Module 2
#==============================================================================


$Domains = @(
    "artificial-intelligence",
    "business",
    "cybersecurity",
    "communication",
    "consulting",
    "data-analytics",
    "design",
    "economics",
    "finance",
    "health",
    "history",
    "knowledge-management",
    "languages",
    "leadership",
    "management",
    "marketing-sales",
    "operations",
    "philosophy",
    "productivity",
    "programming",
    "project-management",
    "psychology",
    "reference",
    "religion-spirituality",
    "research",
    "science",
    "standards-governance",
    "strategy",
    "systems-thinking",
    "technology",
    "writing-publishing",
    "miscellaneous"
)

#==============================================================================
# Module 3
#==============================================================================

# ============================================================================
# Repository Construction Functions
# ============================================================================

function New-DomainStructure
{
    param(
        [string]$ParentPath,
        [string[]]$Types
    )

    foreach($Type in $Types)
    {
        $Base = Join-Path $ParentPath $Type

        New-EKARFolder $Base

        foreach($Domain in $Domains)
        {
            New-EKARFolder (Join-Path $Base $Domain)
        }
    }
}

# ============================================================================
# Create Root Structure
# ============================================================================

Write-Host ""
Write-Host "Creating EKAR repository..."
Write-Host ""

$DocumentsRoot = Join-Path $Root "01-documents"
$MediaRoot      = Join-Path $Root "02-media"
$DataRoot       = Join-Path $Root "03-data"
$SoftwareRoot   = Join-Path $Root "04-software"
$ReferenceRoot  = Join-Path $Root "05-reference"

New-EKARFolder $DocumentsRoot
New-EKARFolder $MediaRoot
New-EKARFolder $DataRoot
New-EKARFolder $SoftwareRoot
New-EKARFolder $ReferenceRoot

New-EKARFolder (Join-Path $Root "06-miscellaneous")
New-EKARFolder (Join-Path $Root "99-archives")

# ============================================================================
# Documents
# ============================================================================

Write-Host "Creating Documents..."

New-DomainStructure `
    -ParentPath $DocumentsRoot `
    -Types $DocumentTypes

New-EKARFolder (Join-Path $DocumentsRoot "miscellaneous")

# ============================================================================
# Media
# ============================================================================

Write-Host "Creating Media..."

New-DomainStructure `
    -ParentPath $MediaRoot `
    -Types $MediaTypes

# ============================================================================
# Data
# ============================================================================

Write-Host "Creating Data..."

New-DomainStructure `
    -ParentPath $DataRoot `
    -Types $DataTypes

# ============================================================================
# Software
# ============================================================================

Write-Host "Creating Software..."

New-DomainStructure `
    -ParentPath $SoftwareRoot `
    -Types $SoftwareTypes

# ============================================================================
# Reference
# ============================================================================

Write-Host "Creating Reference..."

#
# Dictionaries
#

$DictionaryRoot = Join-Path $ReferenceRoot "dictionaries"

New-EKARFolder $DictionaryRoot

foreach($Item in $DictionaryTypes)
{
    New-EKARFolder (Join-Path $DictionaryRoot $Item)
}

#
# Encyclopedias
#

$EncyclopediaRoot = Join-Path $ReferenceRoot "encyclopedias"

New-EKARFolder $EncyclopediaRoot

foreach($Item in $EncyclopediaTypes)
{
    New-EKARFolder (Join-Path $EncyclopediaRoot $Item)
}

#
# Glossaries
#

$GlossaryRoot = Join-Path $ReferenceRoot "glossaries"

New-EKARFolder $GlossaryRoot

foreach($Item in $GlossaryTypes)
{
    New-EKARFolder (Join-Path $GlossaryRoot $Item)
}

#
# Other Reference Material
#

New-EKARFolder (Join-Path $ReferenceRoot "atlases")
New-EKARFolder (Join-Path $ReferenceRoot "style-guides")
New-EKARFolder (Join-Path $ReferenceRoot "language-reference")

#==============================================================================
# Module 4
#==============================================================================

# ============================================================================
# Validation & Summary
# ============================================================================

Write-Host ""
Write-Host "==============================================="
Write-Host " EKAR INITIALIZATION COMPLETED"
Write-Host "==============================================="
Write-Host ""

Write-Host "Enterprise : JayaSwara"
Write-Host "Capability : EKAR"
Write-Host "Framework  : Workflow Monk"
Write-Host "Version    : $ScriptVersion"

Write-Host ""
Write-Host "Repository Root"
Write-Host "---------------"
Write-Host $Root

Write-Host ""

if(Test-Path $Root)
{
    $FolderCount = (Get-ChildItem `
        -Path $Root `
        -Directory `
        -Recurse).Count

    Write-Host "Folders Created : $FolderCount"
    Write-Host "Status          : SUCCESS"
}
else
{
    Write-Host "Status          : FAILED"
    exit 1
}

Write-Host ""
Write-Host "Completed : $(Get-Date)"
Write-Host ""

Write-Host "==============================================="

exit 0
