# PowerShell Script to Combine Chapter Files into a Complete Manuscript
# This script assembles individual chapter Markdown files into a single complete manuscript.

# Configuration variables - modify these for your project
$scriptDir = $PSScriptRoot
$projectRoot = (Get-Item $scriptDir).Parent.Parent.Parent.FullName
$chaptersDir = Join-Path -Path $projectRoot -ChildPath "Chapters"  # Path to directory containing chapter files
$outputFile = Join-Path -Path $projectRoot -ChildPath "Complete_Manuscript.md"  # Path for output file
$frontMatterFile = Join-Path -Path $projectRoot -ChildPath "Front_Matter.md"  # Optional front matter file (title page, etc.)
$backMatterFile = Join-Path -Path $projectRoot -ChildPath "Back_Matter.md"  # Optional back matter file (about author, etc.)
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

    # Use a StringBuilder for efficient string concatenation
    $manuscriptBuilder = New-Object System.Text.StringBuilder

    # Add front matter if it exists
    if (Test-Path $frontMatterFile) {
        Write-Log "Adding front matter from $frontMatterFile" "Green"
        $frontMatterContent = Get-Content $frontMatterFile -Encoding utf8 -Raw
        $manuscriptBuilder.Append($frontMatterContent) | Out-Null
    }

    # Add each chapter to the StringBuilder
    foreach ($file in $chapterFiles) {
        Write-Log "Processing $($file.Name)..." "Cyan"
        $manuscriptBuilder.Append("`n`n<div style='page-break-before: always;'></div>`n`n") | Out-Null
        $chapterContent = Get-Content $file.FullName -Encoding utf8 -Raw
        $manuscriptBuilder.Append($chapterContent) | Out-Null
    }
    
    # Add back matter if it exists
    if (Test-Path $backMatterFile) {
        Write-Log "Adding back matter from $backMatterFile" "Green"
        $manuscriptBuilder.Append("`n`n<div style='page-break-before: always;'></div>`n`n") | Out-Null
        $backMatterContent = Get-Content $backMatterFile -Encoding utf8 -Raw
        $manuscriptBuilder.Append($backMatterContent) | Out-Null
    }
    
    # Write the entire manuscript to the output file in one operation
    Write-Log "Writing complete manuscript to $outputFile..." "Cyan"
    Set-Content -Path $outputFile -Value $manuscriptBuilder.ToString() -Encoding utf8 -Force
    
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
