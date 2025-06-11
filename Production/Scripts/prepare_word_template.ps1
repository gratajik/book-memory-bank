# PowerShell Script to Create Word Reference Template for Pandoc Conversion
# This script generates a properly formatted Word document template with styles that
# Pandoc will use when converting markdown to DOCX format

# Configuration variables - modify for your specific styling needs
$templateFile = "reference.docx"  # Output template file
$fontFamily = "Times New Roman"  # Default body font
$titleFont = "Georgia"  # Font for title elements
$bodySize = 12  # Point size for body text
$headingBaseSize = 16  # Base point size for headings
$lineSpacing = 1.5  # Line spacing for body text

function Write-Log {
    param (
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

function Create-WordTemplate {
    Write-Log "Creating Word reference template for formatting..." "Cyan"
    
    # Check if Word is installed
    try {
        $word = New-Object -ComObject Word.Application
    } catch {
        Write-Log "Error: Microsoft Word is not installed or cannot be accessed." "Red"
        exit 1
    }
    
    # Make Word invisible
    $word.Visible = $false
    
    # Create a new document
    $doc = $word.Documents.Add()
    
    # Configure styles
    # Title style
    $titleStyle = $doc.Styles.Item("Title")
    $titleStyle.Font.Name = $titleFont
    $titleStyle.Font.Size = 24
    $titleStyle.Font.Bold = $true
    $titleStyle.ParagraphFormat.Alignment = 1  # Center aligned
    $titleStyle.ParagraphFormat.SpaceAfter = 24  # Space after in points
    
    # Heading 1 (Chapter Titles) - Always start on new page
    $h1Style = $doc.Styles.Item("Heading 1")
    $h1Style.Font.Name = $titleFont
    $h1Style.Font.Size = $headingBaseSize + 4  # 20pt
    $h1Style.Font.Bold = $true
    $h1Style.ParagraphFormat.Alignment = 1  # Center aligned
    $h1Style.ParagraphFormat.SpaceAfter = 24  # Space after in points
    $h1Style.ParagraphFormat.SpaceBefore = 36  # Space before in points
    $h1Style.ParagraphFormat.PageBreakBefore = $true  # Start chapter on new page
    
    # Heading 2 (Section Headings)
    $h2Style = $doc.Styles.Item("Heading 2")
    $h2Style.Font.Name = $titleFont
    $h2Style.Font.Size = $headingBaseSize + 2  # 18pt
    $h2Style.Font.Bold = $true
    $h2Style.ParagraphFormat.SpaceAfter = 12
    $h2Style.ParagraphFormat.SpaceBefore = 24
    
    # Heading 3 (Subsections)
    $h3Style = $doc.Styles.Item("Heading 3")
    $h3Style.Font.Name = $titleFont
    $h3Style.Font.Size = $headingBaseSize  # 16pt
    $h3Style.Font.Bold = $true
    $h3Style.Font.Italic = $true
    $h3Style.ParagraphFormat.SpaceAfter = 12
    $h3Style.ParagraphFormat.SpaceBefore = 12
    
    # Normal text (Body)
    $normalStyle = $doc.Styles.Item("Normal")
    $normalStyle.Font.Name = $fontFamily
    $normalStyle.Font.Size = $bodySize
    $normalStyle.ParagraphFormat.LineSpacingRule = 1  # Line spacing
    $normalStyle.ParagraphFormat.LineSpacing = $lineSpacing * 12  # Convert to points
    $normalStyle.ParagraphFormat.SpaceAfter = 8
    $normalStyle.ParagraphFormat.FirstLineIndent = 36  # 0.5 inch indent for paragraphs
    $normalStyle.ParagraphFormat.Alignment = 3  # Justified text (3 = wdAlignParagraphJustify)
    
    # Blockquote
    try {
        $blockStyle = $doc.Styles.Add("Blockquote")
        $blockStyle.Font.Name = $fontFamily
        $blockStyle.Font.Size = $bodySize
        $blockStyle.Font.Italic = $true
        $blockStyle.ParagraphFormat.LeftIndent = 36  # Left indent
        $blockStyle.ParagraphFormat.RightIndent = 36  # Right indent
        $blockStyle.ParagraphFormat.SpaceAfter = 12
        $blockStyle.ParagraphFormat.SpaceBefore = 12
    } catch {
        Write-Log "Blockquote style already exists or could not be created. Continuing..." "Yellow"
    }
    
    # Code blocks
    try {
        $codeStyle = $doc.Styles.Add("Code")
        $codeStyle.Font.Name = "Consolas"
        $codeStyle.Font.Size = $bodySize - 2  # Slightly smaller
        $codeStyle.ParagraphFormat.LeftIndent = 36
        $codeStyle.ParagraphFormat.RightIndent = 36
        $codeStyle.ParagraphFormat.SpaceAfter = 12
        $codeStyle.ParagraphFormat.SpaceBefore = 12
    } catch {
        Write-Log "Code style already exists or could not be created. Continuing..." "Yellow"
    }
    
    # Page setup
    $doc.PageSetup.TopMargin = 72  # 1 inch in points
    $doc.PageSetup.BottomMargin = 72
    $doc.PageSetup.LeftMargin = 72
    $doc.PageSetup.RightMargin = 72
    
    # Add sample content - this helps ensure styles are saved properly
    $doc.Content.InsertAfter("Title Example`r`n")
    $doc.Content.Paragraphs.Last.Style = $doc.Styles.Item("Title")
    
    $doc.Content.InsertAfter("`r`nChapter 1: Chapter Title Example`r`n")
    $doc.Content.Paragraphs.Last.Style = $doc.Styles.Item("Heading 1")
    
    $doc.Content.InsertAfter("`r`nSection Heading Example`r`n")
    $doc.Content.Paragraphs.Last.Style = $doc.Styles.Item("Heading 2")
    
    $doc.Content.InsertAfter("`r`nSubsection Example`r`n")
    $doc.Content.Paragraphs.Last.Style = $doc.Styles.Item("Heading 3")
    
    $doc.Content.InsertAfter("`r`nThis is an example of body text formatting. It demonstrates the paragraph style, font family, size, and line spacing that will be used in the document.`r`n")
    $doc.Content.Paragraphs.Last.Style = $doc.Styles.Item("Normal")
    
    # Save the document
    $doc.SaveAs([ref]$templateFile, [ref]16) # 16 = wdFormatDocumentDefault
    $doc.Close()
    $word.Quit()
    
    # Cleanup COM objects
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($doc) | Out-Null
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($word) | Out-Null
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()
    
    Write-Log "Word reference template created successfully: $templateFile" "Green"
}

# Main execution
try {
    Create-WordTemplate
} catch {
    Write-Log "Error creating Word template: $_" "Red"
    exit 1
}
