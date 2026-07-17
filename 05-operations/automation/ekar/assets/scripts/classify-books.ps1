<#
===============================================================================
EKAR LIBRARY ENGINEERING
-------------------------------------------------------------------------------
Script        : classify-books.ps1
Version       : 0.1.0 (Pilot)
Enterprise    : JayaSwara
Framework     : Workflow Monk
Capability    : EKAR
Author        : Rajeev

Purpose
-------
Reads a library inventory CSV and proposes a destination category for each
resource based on filename keyword matching.

This script DOES NOT move any files.

Output:
classification-output.csv

===============================================================================
#>

Clear-Host

Write-Host ""
Write-Host "==============================================================="
Write-Host " EKAR LIBRARY ENGINEERING"
Write-Host " Classification Engine v0.1"
Write-Host "==============================================================="
Write-Host ""

# -------------------------------------------------------------------------
# CONFIGURATION
# -------------------------------------------------------------------------

$CsvFile = Read-Host "Enter path to library CSV"

$OutputFile = Read-Host "Enter output CSV path"

# -------------------------------------------------------------------------
# CATEGORY RULES (Pilot)
# -------------------------------------------------------------------------

$Rules = @{

    "python"                  = "programming"
    "sql"                     = "databases"
    "database"                = "databases"

    "artificial intelligence" = "artificial-intelligence"
    "machine learning"        = "artificial-intelligence"
    "chatgpt"                 = "artificial-intelligence"
    "llm"                     = "artificial-intelligence"

    "marketing"               = "marketing"
    "copywriting"             = "marketing"

    "finance"                 = "finance"
    "accounting"              = "finance"

    "gita"                    = "bhagavad-gita"
    "bhagavad"                = "bhagavad-gita"

    "vedanta"                 = "indian-philosophy"

}

# -------------------------------------------------------------------------
# LOAD CSV
# -------------------------------------------------------------------------

$Books = Import-Csv $CsvFile | Select-Object -First 10

$Results = @()

foreach($Book in $Books)
{

    $Title = $Book.Name.ToLower()

    $MatchedKeyword = ""
    $Category = "Needs-Review"

    foreach($Rule in $Rules.Keys)
    {
        if($Title -like "*$Rule*")
        {
            $MatchedKeyword = $Rule
            $Category = $Rules[$Rule]
            break
        }
    }

    $Destination = ""

    if($Category -eq "Needs-Review")
    {
        $Destination = "Needs-Review"
    }
    else
    {
        $Destination = "01-documents\books\$Category"
    }

    $Results += [PSCustomObject]@{

        DirectoryName       = $Book.DirectoryName
        Name                = $Book.Name
        Extension           = $Book.Extension
        SizeMB              = $Book.SizeMB

        MatchedKeyword      = $MatchedKeyword
        Category            = $Category
        DestinationFolder   = $Destination

        ClassificationStatus =
            if($Category -eq "Needs-Review")
            {
                "Needs Review"
            }
            else
            {
                "Matched"
            }

    }

}

# -------------------------------------------------------------------------
# EXPORT
# -------------------------------------------------------------------------

$Results |
Export-Csv `
    -Path $OutputFile `
    -NoTypeInformation `
    -Encoding UTF8

# -------------------------------------------------------------------------
# SUMMARY
# -------------------------------------------------------------------------

$Matched =
($Results | Where-Object {$_.ClassificationStatus -eq "Matched"}).Count

$Review =
($Results | Where-Object {$_.ClassificationStatus -eq "Needs Review"}).Count

Write-Host ""
Write-Host "Classification Complete"
Write-Host ""

Write-Host "Resources : $($Results.Count)"
Write-Host "Matched   : $Matched"
Write-Host "Review    : $Review"

Write-Host ""
Write-Host "Output:"
Write-Host $OutputFile
Write-Host ""
