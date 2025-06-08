# PowerShell Script to Combine Chapter Files into a Complete Manuscript
# This script assembles individual chapter Markdown files into a single complete manuscript.

# Configuration variables - modify these for your project
$chaptersDir = "..\Chapters"  # Path to directory containing chapter files
$outputFile = "..\Complete_Manuscript.md"  # Path for output file
$frontMatterFile = "..\Front_Matter.md"  # Optional front matter file (title page, etc.)
$backMatterFile = "..\Back_Matter.md"  # Optional back matter file (about author, etc.)
$chapterPrefix = "Chapter"  # Filename prefix for chapter files

function Write-Log {
    param (
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

function Create-CompleteManuscript {
    Write-Log "Starting manuscript assembly process..." "Cyan"
    
    # Create output file and add front matter if exists
    if (Test-Path $frontMatterFile) {
        Write-Log "Adding front matter from $frontMatterFile" "Green"
        Get-Content $frontMatterFile | Out-File -FilePath $outputFile -Encoding utf8
    } else {
        Write-Log "No front matter file found at $frontMatterFile, creating new file" "Yellow"
        # Create empty file
        New-Item -Path $outputFile -ItemType File -Force | Out-Null
    }

    # Check if chapters directory exists
    if (-not (Test-Path $chaptersDir)) {
        Write-Log "Error: Chapters directory not found at $chaptersDir" "Red"
        exit 1
    }

    # Get all chapter files and sort them numerically
    $chapterFiles = Get-ChildItem -Path $chaptersDir -Filter "$chapterPrefix*.md" | 
                    Sort-Object { [regex]::Match($_.Name, '\d+').Value -as [int] }
    
    if ($chapterFiles.Count -eq 0) {
        Write-Log "Error: No chapter files found in $chaptersDir" "Red"
        exit 1
    }
    
    Write-Log "Found $($chapterFiles.Count) chapter files to process" "Green"
    
    # Add each chapter to the output file
    $chapterNum = 1
    foreach ($file in $chapterFiles) {
        Write-Log "Processing $($file.Name)..." "Cyan"
        
        # Add chapter separator - a page break in Markdown
        Add-Content -Path $outputFile -Value "`n`n<div style='page-break-before: always;'></div>`n`n"
        
        # Add chapter content
        Get-Content $file.FullName | Out-File -FilePath $outputFile -Encoding utf8 -Append
        
        $chapterNum++
    }
    
    # Add back matter if exists
    if (Test-Path $backMatterFile) {
        Write-Log "Adding back matter from $backMatterFile" "Green"
        Add-Content -Path $outputFile -Value "`n`n<div style='page-break-before: always;'></div>`n`n"
        Get-Content $backMatterFile | Out-File -FilePath $outputFile -Encoding utf8 -Append
    }
    
    Write-Log "Manuscript assembly complete! Output file: $outputFile" "Green"
    Write-Log "Total chapters: $($chapterFiles.Count)" "Green"
    Write-Log "Word count estimate: $((Get-Content $outputFile | Measure-Object -Word).Words) words" "Green"
}

# Main execution
try {
    Create-CompleteManuscript
} catch {
    Write-Log "Error occurred during manuscript assembly: $_" "Red"
    exit 1
}
