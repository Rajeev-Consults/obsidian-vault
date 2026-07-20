#========================================================
# Module 1
#========================================================
# ==================================================================================================
#
# EKAR Library Classification Engine
#
# File        : classify-books.ps1
# Version     : 1.0.0
# Status      : Development
#
# Enterprise  : JayaSwara
# Capability  : EKAR
# Framework   : Workflow Monk
#
# Description :
#     Reads the exported library inventory and classifies every resource
#     using the EKAR Knowledge Taxonomy.
#
# Inputs :
#     books.csv
#     ekar-taxonomy.csv
#
# Output :
#     classified-books.csv
#
# Author :
#     Workflow Monk
#
# ==================================================================================================

Clear-Host

$ErrorActionPreference = "Stop"

# --------------------------------------------------------------------------------------------------
# Configuration
# --------------------------------------------------------------------------------------------------

$BooksFile      = "E:\Work\EKAR\03-data\books.csv"
$TaxonomyFile   = "E:\Work\EKAR\03-data\\ekar-taxonomy.csv"
$OutputFile     = "E:\Work\EKAR\03-data\\classified-books.csv"

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " EKAR Library Classification Engine v1.0" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

#==========================================================================================
# Module 2
#=========================================================================================
# ==================================================================================================
# Validate Input Files
# ==================================================================================================

Write-Host "Validating input files..." -ForegroundColor Yellow

if (!(Test-Path $BooksFile))
{
    Write-Host ""
    Write-Host "ERROR : books.csv not found." -ForegroundColor Red
    exit
}

if (!(Test-Path $TaxonomyFile))
{
    Write-Host ""
    Write-Host "ERROR : ekar-taxonomy.csv not found." -ForegroundColor Red
    exit
}

Write-Host "Input validation successful." -ForegroundColor Green
Write-Host ""

#===========================================================================
# Module 3
#===========================================================================
# ==================================================================================================
# Import CSV Files
# ==================================================================================================

Write-Host "Loading library inventory..." -ForegroundColor Yellow

$Books = Import-Csv $BooksFile

Write-Host ("Books Loaded      : {0}" -f $Books.Count)

Write-Host ""
Write-Host "Loading EKAR Taxonomy..." -ForegroundColor Yellow

$Taxonomy = Import-Csv $TaxonomyFile

Write-Host ("Taxonomy Entries  : {0}" -f $Taxonomy.Count)
Write-Host ""

#===========================================================================
# Module 4
#===========================================================================
# ==================================================================================================
# Helper Functions
# ==================================================================================================

function Normalize-Text
{
    param
    (
        [string]$Text
    )

    if ([string]::IsNullOrWhiteSpace($Text))
    {
        return ""
    }

    $Text = $Text.ToLower()

    $Text = $Text -replace '[\(\)\[\]\{\}\-_,.]',' '

    $Text = $Text -replace '\s+',' '

    return $Text.Trim()
}

function Get-SearchText
{
    param
    (
        $Book
    )

    return (
        Normalize-Text(
            $Book.DirectoryName + " " + $Book.Name
        )
    )
}

#======================================================================================
# Module 5
#======================================================================================

# ==================================================================================================
# Classification Engine
# ==================================================================================================

Write-Host "Beginning classification..." -ForegroundColor Yellow
Write-Host ""

$Results = @()

$BookNumber = 0
$TotalBooks = $Books.Count

foreach ($Book in $Books)
{
    $BookNumber++

    Write-Progress `
        -Activity "Classifying Library" `
        -Status "$BookNumber of $TotalBooks" `
        -PercentComplete (($BookNumber / $TotalBooks) * 100)

    $SearchText = Get-SearchText $Book

    $Matched = $false

    $MatchedKeyword = ""

    $ResourceType = "books"

    $Domain = "miscellaneous"

    $Confidence = "None"

    foreach ($Rule in $Taxonomy)
    {
        if ([string]::IsNullOrWhiteSpace($Rule.Keywords))
        {
            continue
        }

        $Keywords = $Rule.Keywords.Split('|')

        foreach ($Keyword in $Keywords)
        {
            $Keyword = Normalize-Text $Keyword

            if ([string]::IsNullOrWhiteSpace($Keyword))
            {
                continue
            }

            if ($SearchText -match "\b$([regex]::Escape($Keyword))\b")
            {
                $Matched = $true

                $MatchedKeyword = $Keyword

                $ResourceType = $Rule.ResourceType

                $Domain = $Rule.Domain

                $Confidence = "High"

                break
            }
        }

        if ($Matched)
        {
            break
        }
    }

    $DestinationPath = Join-Path $ResourceType $Domain

    if ($Matched)
    {
        $Status = "Classified"
    }
    else
    {
        $Status = "Needs Review"
    }

    $Results += [PSCustomObject]@{

        DirectoryName = $Book.DirectoryName

        Name = $Book.Name

        Extension = $Book.Extension

        SizeMB = $Book.SizeMB

        ResourceType = $ResourceType

        Domain = $Domain

        DestinationPath = $DestinationPath

        MatchedKeyword = $MatchedKeyword

        Confidence = $Confidence

        Status = $Status
    }
}

Write-Host ""
Write-Host "Classification complete." -ForegroundColor Green
Write-Host ""

#====================================================================================
# Module 6
#====================================================================================

# ==================================================================================================
# Export Results
# ==================================================================================================

Write-Host "Writing classified library..." -ForegroundColor Yellow

$Results |
    Export-Csv `
        -Path $OutputFile `
        -NoTypeInformation `
        -Encoding UTF8

Write-Host "Output written to $OutputFile" -ForegroundColor Green
Write-Host ""

#========================================================================================
# Module 7
#=========================================================================================

# ==================================================================================================
# Statistics
# ==================================================================================================

$Total = $Results.Count

$Classified = ($Results | Where-Object {$_.Status -eq "Classified"}).Count

$Review = ($Results | Where-Object {$_.Status -eq "Needs Review"}).Count

$Rate = [math]::Round(($Classified / $Total) * 100,2)

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " Classification Summary" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan

Write-Host ("Books Processed     : {0}" -f $Total)

Write-Host ("Classified          : {0}" -f $Classified)

Write-Host ("Needs Review        : {0}" -f $Review)

Write-Host ("Classification Rate : {0}%" -f $Rate)

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

#==========================================================================
# Module 8
#==========================================================================

# ==================================================================================================
# Completion
# ==================================================================================================

Write-Host "EKAR Classification Completed Successfully." -ForegroundColor Green

Write-Host ""

Write-Host "Output File"

Write-Host "-----------"

Write-Host $OutputFile -ForegroundColor Yellow

Write-Host ""


