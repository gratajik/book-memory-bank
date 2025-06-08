# PowerShell Script to Extract Key Information from Chapter Content
# This script analyzes a chapter file and extracts information for memory bank updates.

# Configuration variables - modify these for your project
$chaptersDir = "..\Chapters"  # Path to directory containing chapter files
$outputDir = ".\Information_Extracts"  # Directory for output files
$chapterFile = ""  # Specific chapter file to analyze (leave empty for latest)

function Write-Log {
    param (
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

function Create-DirectoryIfNotExists {
    param (
        [string]$Path
    )
    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -ItemType Directory -Force | Out-Null
        Write-Log "Created directory: $Path" "Yellow"
    }
}

function Extract-ChapterInformation {
    # Ensure output directory exists
    Create-DirectoryIfNotExists $outputDir

    # Identify which chapter file to analyze
    if ([string]::IsNullOrEmpty($chapterFile)) {
        # If no specific file, get the most recent chapter file
        if (-not (Test-Path $chaptersDir)) {
            Write-Log "Error: Chapters directory not found at $chaptersDir" "Red"
            exit 1
        }
        
        $chapterFiles = Get-ChildItem -Path $chaptersDir -Filter "Chapter*.md" | 
                        Sort-Object LastWriteTime -Descending
        
        if ($chapterFiles.Count -eq 0) {
            Write-Log "Error: No chapter files found in $chaptersDir" "Red"
            exit 1
        }
        
        $chapterToAnalyze = $chapterFiles[0].FullName
        $chapterName = $chapterFiles[0].BaseName
    } else {
        # Use the specified chapter file
        $chapterPath = Join-Path -Path $chaptersDir -ChildPath $chapterFile
        if (-not (Test-Path $chapterPath)) {
            Write-Log "Error: Specified chapter file not found at $chapterPath" "Red"
            exit 1
        }
        $chapterToAnalyze = $chapterPath
        $chapterName = [System.IO.Path]::GetFileNameWithoutExtension($chapterFile)
    }

    Write-Log "Analyzing chapter: $chapterName" "Cyan"
    
    # Read the chapter content
    $chapterContent = Get-Content -Path $chapterToAnalyze -Raw
    
    # Create timestamp for the extract files
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    
    # Extract character information
    $characterOutputFile = Join-Path -Path $outputDir -ChildPath "$($chapterName)_Characters_$timestamp.md"
    Extract-CharacterInformation -Content $chapterContent -OutputFile $characterOutputFile -ChapterName $chapterName
    
    # Extract world building information
    $worldOutputFile = Join-Path -Path $outputDir -ChildPath "$($chapterName)_World_$timestamp.md"
    Extract-WorldInformation -Content $chapterContent -OutputFile $worldOutputFile -ChapterName $chapterName
    
    # Extract plot developments
    $plotOutputFile = Join-Path -Path $outputDir -ChildPath "$($chapterName)_Plot_$timestamp.md"
    Extract-PlotInformation -Content $chapterContent -OutputFile $plotOutputFile -ChapterName $chapterName

    # Create a summary file with references to all extracts
    $summaryFile = Join-Path -Path $outputDir -ChildPath "$($chapterName)_Summary_$timestamp.md"
    
    $summaryContent = @"
# Information Extracted from $chapterName

## Overview
This file contains references to information extracted from $chapterName for updating the Book Memory Bank.
Extraction performed on $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")

## Extracted Information Files
- [Character Information](./$($chapterName)_Characters_$timestamp.md)
- [World Building Information](./$($chapterName)_World_$timestamp.md)
- [Plot Developments](./$($chapterName)_Plot_$timestamp.md)

## Memory Bank Update Instructions
1. Review each extracted file
2. Copy relevant information to the appropriate memory bank files:
   - Character details → character_profiles.md
   - World elements → worldContext.md
   - Plot developments → master_outline.md and chapter outlines
3. Update activeContext.md with a summary of changes
4. Update progress.md with completion status

## Manual Review Notes
[Add your notes about what's important to update here]
"@

    Set-Content -Path $summaryFile -Value $summaryContent
    
    Write-Log "Information extraction complete!" "Green"
    Write-Log "Summary file created at: $summaryFile" "Green"
    Write-Log "Remember to review the extracted information and update your memory bank files." "Yellow"
}

function Extract-CharacterInformation {
    param (
        [string]$Content,
        [string]$OutputFile,
        [string]$ChapterName
    )
    
    # Create a header for the file
    $header = @"
# Character Information Extracted from $ChapterName

This file contains character details, traits, relationships, and developments that should be
added to character profiles in the Book Memory Bank.

## Character Appearances
The following characters appear in this chapter:

"@

    # Simple regex pattern to identify character names (can be customized for your book)
    $characterPattern = "[A-Z][a-z]+ (?:[A-Z][a-z]+ )?(?:[A-Z][a-z]+)?"
    $characters = [regex]::Matches($Content, $characterPattern) | 
                 ForEach-Object { $_.Value } | 
                 Sort-Object | 
                 Get-Unique
    
    $characterList = $characters | ForEach-Object { "- $_" }
    
    $instructions = @"

## Character Development Notes
For each character that experienced development, note the changes below:

### [Character Name]
- [New trait or attribute]
- [Relationship development]
- [New backstory element]
- [Important decision or action]

### [Character Name]
- [New trait or attribute]
- [Relationship development]
- [New backstory element]
- [Important decision or action]

## New Characters Introduced
If new characters were introduced in this chapter, create a profile entry with:

### [New Character Name]
- **Role**: [Character's role in story]
- **Description**: [Physical appearance and notable traits]
- **Background**: [Relevant backstory]
- **Relationships**: [Connections to other characters]
- **Goals/Motivations**: [What drives this character]

## Memory Bank Updates
The following updates should be made to character_profiles.md:

1. [Specific update instruction]
2. [Specific update instruction]
3. [Specific update instruction]
"@

    $content = $header + [System.Environment]::NewLine + ($characterList -join [System.Environment]::NewLine) + [System.Environment]::NewLine + $instructions
    
    Set-Content -Path $OutputFile -Value $content
    Write-Log "Character information extracted to: $OutputFile" "Green"
}

function Extract-WorldInformation {
    param (
        [string]$Content,
        [string]$OutputFile,
        [string]$ChapterName
    )
    
    $worldContent = @"
# World Building Information Extracted from $ChapterName

This file contains settings, locations, rules, and world elements that should be
added to worldContext.md in the Book Memory Bank.

## Locations

### [Location Name]
- [Description of location]
- [Notable features]
- [Significance in story]

### [Location Name]
- [Description of location]
- [Notable features]
- [Significance in story]

## Objects & Items

### [Object/Item Name]
- [Description]
- [Properties/capabilities]
- [Significance]

## Rules & Systems

### [Rule or System Name]
- [Description of how it works]
- [Limitations or constraints]
- [Examples shown in chapter]

## Historical & Cultural Elements

### [Element Name]
- [Description]
- [Impact on story/characters]
- [Connections to broader world]

## Memory Bank Updates
The following updates should be made to worldContext.md:

1. [Specific update instruction]
2. [Specific update instruction]
3. [Specific update instruction]
"@

    Set-Content -Path $OutputFile -Value $worldContent
    Write-Log "World building information extracted to: $OutputFile" "Green"
}

function Extract-PlotInformation {
    param (
        [string]$Content,
        [string]$OutputFile,
        [string]$ChapterName
    )
    
    $plotContent = @"
# Plot Developments Extracted from $ChapterName

This file contains plot points, developments, and timeline information that should be
updated in master_outline.md and the relevant chapter outline.

## Major Events

### [Event Title]
- [Description of what happened]
- [Characters involved]
- [Consequences and implications]

### [Event Title]
- [Description of what happened]
- [Characters involved]
- [Consequences and implications]

## Revelations & Discoveries

### [Revelation Title]
- [What was revealed]
- [How it was discovered]
- [Impact on the story]

## Conflicts & Tensions

### [Conflict Title]
- [Description of conflict]
- [Parties involved]
- [Current status]

## Foreshadowing & Setups

### [Element Foreshadowed]
- [How it was hinted at]
- [Potential future payoff]

## Timeline Clarifications

- [Specific timing details established]
- [How this relates to overall timeline]
- [Any corrections needed to previous timeline]

## Memory Bank Updates
The following updates should be made to plot-related files:

1. [Update to master_outline.md]
2. [Update to chapter outline]
3. [Connection to update in another chapter outline]
"@

    Set-Content -Path $OutputFile -Value $plotContent
    Write-Log "Plot information extracted to: $OutputFile" "Green"
}

# Main execution
try {
    # Create a parameter prompt if run directly
    if ($chapterFile -eq "") {
        # Prompt for the chapter file if not specified as a parameter
        Write-Log "No chapter file specified. Options:" "Cyan"
        
        if (Test-Path $chaptersDir) {
            $availableChapters = Get-ChildItem -Path $chaptersDir -Filter "Chapter*.md" | 
                                Sort-Object Name
            
            if ($availableChapters.Count -gt 0) {
                for ($i = 0; $i -lt $availableChapters.Count; $i++) {
                    Write-Log "[$i] $($availableChapters[$i].Name)" "White"
                }
                
                Write-Log "[L] Latest chapter" "White"
                Write-Log "[A] All chapters" "White"
                
                $choice = Read-Host "Enter choice (number, L, or A)"
                
                if ($choice -eq "L") {
                    # Latest chapter (default) - leave chapterFile empty
                } elseif ($choice -eq "A") {
                    Write-Log "Analyzing all chapters not yet implemented" "Yellow"
                    # Future feature: process all chapters
                } elseif ($choice -match "^\d+$" -and [int]$choice -lt $availableChapters.Count) {
                    $chapterFile = $availableChapters[[int]$choice].Name
                } else {
                    Write-Log "Invalid choice. Using latest chapter." "Yellow"
                }
            } else {
                Write-Log "No chapter files found in $chaptersDir" "Yellow"
            }
        }
    }
    
    Extract-ChapterInformation
} catch {
    Write-Log "Error occurred during information extraction: $_" "Red"
    exit 1
}
