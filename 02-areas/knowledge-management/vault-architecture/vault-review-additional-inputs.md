# Vault Snapshot Generation

When requesting a system review from ChatGPT:

Export and provide:

## ObsidianVault

- Folder structure
    
- MOCs
    
- Dashboards
    
- Services
    
- Frameworks
    
- Operations
    
- Workflow Monk notes
    
- Website notes
    

---

## Active-Projects

- Folder structure
    
- Dashboard
    
- Templates
    
- Active project summaries
    

---

## Knowledge Vault

- Folder structure
    
- Major indexes
    
- Knowledge maps
    
- Core frameworks
    

---

## Visuals

Provide:

- Global graph screenshot
    
- Local graph screenshots for major MOCs
    
- Dataview dashboards (if applicable)
    

---

## Review Request

Use:

"Perform a Vault Coherence Review using the latest exports and identify:

- structural drift
    
- orphan notes
    
- missing links
    
- MOC gaps
    
- cross-vault gaps
    
- knowledge flow issues
    
- maintenance risks
    

Recommend only the minimum changes required to improve coherence."

The review should optimize for execution, maintainability, retrieval, and long-term scalability


**Change the scripts for destination locations (save with extension .ps1**

**For Obsidian Vault**
# Path to your Obsidian vault
$vaultpath = "E:\Dev\ObsidianVault"

# Output file
$outputFile = "C:\VaultExport.md"

# Start fresh
Remove-Item $outputFile -ErrorAction SilentlyContinue

# Write vault structure first
"## Vault Structure" | Out-File $outputFile
tree $vaultPath /A | Out-File $outputFile -Append

# Add contents of each note
"`n## Vault Contents" | Out-File $outputFile -Append

Get-ChildItem -Path $vaultPath -Recurse -Filter *.md | ForEach-Object {
    $relativePath = $_.FullName.Substring($vaultPath.Length)
    "`n### $relativePath" | Out-File $outputFile -Append
    Get-Content $_.FullName | Out-File $outputFile -Append
}


**For Active-Projects Vault**

# Path to your Obsidian vault
$vaultpath = "c:\sync\obsidian\Active-Projects"

# Output file
$outputFile = "C:\ActiveProjectsExport.md"

# Start fresh
Remove-Item $outputFile -ErrorAction SilentlyContinue

# Write vault structure first
"## Vault Structure" | Out-File $outputFile
tree $vaultPath /A | Out-File $outputFile -Append

# Add contents of each note
"`n## Vault Contents" | Out-File $outputFile -Append

Get-ChildItem -Path $vaultPath -Recurse -Filter *.md | ForEach-Object {
    $relativePath = $_.FullName.Substring($vaultPath.Length)
    "`n### $relativePath" | Out-File $outputFile -Append
    Get-Content $_.FullName | Out-File $outputFile -Append
}


**For Knowledge Vault**

# Path to your Obsidian vault
$vaultpath = "E:\Obsidian\work\KnowledgeVault"

# Output file
$outputFile = "C:\KnowledgeVaultExport.md"

# Start fresh
Remove-Item $outputFile -ErrorAction SilentlyContinue

### Write vault structure first
"## Vault Structure" | Out-File $outputFile
tree $vaultPath /A | Out-File $outputFile -Append

### Add contents of each note
"`n## Vault Contents" | Out-File $outputFile -Append

Get-ChildItem -Path $vaultPath -Recurse -Filter *.md | ForEach-Object {
    $relativePath = $_.FullName.Substring($vaultPath.Length)
    "`n### $relativePath" | Out-File $outputFile -Append
    Get-Content $_.FullName | Out-File $outputFile -Append
}
