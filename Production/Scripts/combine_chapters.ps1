# PowerShell Script to Combine Chapter Files into a Complete Manuscript
# This script assembles individual chapter Markdown files into a single complete manuscript.

# Configuration variables - modify these for your project
$scriptDir = $PSScriptRoot
$projectRoot = (Get-Item $scriptDir).Parent.Parent.Parent.FullName
$chaptersDir = Join-Path -Path $projectRoot -ChildPath "Chapters"  # Path to directory containing chapter files
$frontBackMatterDir = Join-Path -Path $projectRoot -ChildPath "Front_Back_Matter"  # Path to front/back matter files
$outputFile = Join-Path -Path $projectRoot -ChildPath "Complete_Manuscript.md"  # Path for output file
$chapterPrefix = "Chapter"  # Filename prefix for chapter files
$frontMatterFiles = @("01_Title_Page.md", "02_Copyright_Page.md", "03_Table_of_Contents.md", "04_Acknowledgments.md")
$backMatterFiles = @("05_About_the_Author.md", "06_Thank_You.md")

function Write-Log {
    param (
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

function Create-CompleteManuscript {
    Write-Log "Starting manuscript assembly process..." "Cyan"

    # Check if directories exist
    if (-not (Test-Path $chaptersDir)) {
        Write-Log "Error: Chapters directory not found at $chaptersDir" "Red"
        exit 1
    }
    
    if (-not (Test-Path $frontBackMatterDir)) {
        Write-Log "Error: Front_Back_Matter directory not found at $frontBackMatterDir" "Red"
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
    $isFirstFile = $true

    # Add front matter files (01-04) - each on its own page
    Write-Log "Processing Front Matter files..." "Green"
    foreach ($frontMatterFile in $frontMatterFiles) {
        $frontMatterPath = Join-Path -Path $frontBackMatterDir -ChildPath $frontMatterFile
        if (Test-Path $frontMatterPath) {
            Write-Log "Adding front matter: $frontMatterFile" "Cyan"
            
            # Add page break before each file except the very first one
            if (-not $isFirstFile) {
                $manuscriptBuilder.Append("`n`n<div style='page-break-before: always;'></div>`n`n") | Out-Null
            }
            $isFirstFile = $false
            
            $frontMatterContent = Get-Content $frontMatterPath -Encoding utf8 -Raw
            $manuscriptBuilder.Append($frontMatterContent) | Out-Null
        } else {
            Write-Log "Warning: Front matter file not found: $frontMatterFile" "Yellow"
        }
    }

    # Add each chapter - each on its own page
    Write-Log "Processing Chapter files..." "Green"
    foreach ($file in $chapterFiles) {
        Write-Log "Processing chapter: $($file.Name)" "Cyan"
        
        # Add page break before each chapter
        $manuscriptBuilder.Append("`n`n<div style='page-break-before: always;'></div>`n`n") | Out-Null
        
        $chapterContent = Get-Content $file.FullName -Encoding utf8 -Raw
        $manuscriptBuilder.Append($chapterContent) | Out-Null
    }
    
    # Add back matter files (05-06) - each on its own page
    Write-Log "Processing Back Matter files..." "Green"
    foreach ($backMatterFile in $backMatterFiles) {
        $backMatterPath = Join-Path -Path $frontBackMatterDir -ChildPath $backMatterFile
        if (Test-Path $backMatterPath) {
            Write-Log "Adding back matter: $backMatterFile" "Cyan"
            
            # Add page break before each back matter file
            $manuscriptBuilder.Append("`n`n<div style='page-break-before: always;'></div>`n`n") | Out-Null
            
            $backMatterContent = Get-Content $backMatterPath -Encoding utf8 -Raw
            $manuscriptBuilder.Append($backMatterContent) | Out-Null
        } else {
            Write-Log "Warning: Back matter file not found: $backMatterFile" "Yellow"
        }
    }
    
    # Write the entire manuscript to the output file in one operation
    Write-Log "Writing complete manuscript to $outputFile..." "Cyan"
    Set-Content -Path $outputFile -Value $manuscriptBuilder.ToString() -Encoding utf8 -Force
    
    # Calculate statistics
    $totalFrontMatterFiles = ($frontMatterFiles | ForEach-Object { if (Test-Path (Join-Path -Path $frontBackMatterDir -ChildPath $_)) { 1 } }).Count
    $totalBackMatterFiles = ($backMatterFiles | ForEach-Object { if (Test-Path (Join-Path -Path $frontBackMatterDir -ChildPath $_)) { 1 } }).Count
    $wordCount = (Get-Content $outputFile | Measure-Object -Word).Words
    
    Write-Log "Manuscript assembly complete! Output file: $outputFile" "Green"
    Write-Log "Front matter files: $totalFrontMatterFiles" "Green"
    Write-Log "Chapters: $($chapterFiles.Count)" "Green"
    Write-Log "Back matter files: $totalBackMatterFiles" "Green"
    Write-Log "Total sections: $($totalFrontMatterFiles + $chapterFiles.Count + $totalBackMatterFiles)" "Green"
    Write-Log "Word count estimate: $wordCount words" "Green"
}

# Main execution
try {
    Create-CompleteManuscript
} catch {
    Write-Log "Error occurred during manuscript assembly: $_" "Red"
    exit 1
}
