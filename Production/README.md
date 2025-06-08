# Production Directory

This directory contains resources and tools for the book production process, including publication preparation, automation scripts, and AI-assisted generation tools.

## Structure

- **AI_Generation/** - Templates and prompts for AI-assisted content generation
  - `cover_prompts.md` - Instructions for creating book covers with AI tools

- **Scripts/** - Automation tools for manuscript preparation
  - `combine_chapters.ps1` - PowerShell script to assemble all chapters into a single document  
  - `generate_docx.bat` - Batch script to convert markdown to properly formatted Word document
  - `prepare_word_template.ps1` - PowerShell script to configure Word document formatting

## Usage

### Book Cover Generation

The `AI_Generation/cover_prompts.md` file provides structured prompts for generating book covers with AI image generation tools. These prompts can be customized based on your book's genre, theme, and style.

Example:
```
I want to generate a book cover for my science fiction novel titled "DERELICT." 
The story involves an abandoned spaceship with ancient alien technology.
The mood is dark, mysterious, and tense.
```

### Publication Preparation

### Main Script

Run generate_docx.bat to run the other scripts, which will create the Word file for your book

### Manuscript Preparation

The scripts in the Scripts directory automate the process of preparing your manuscript for publication:

1. **Combine Chapters**:
   ```powershell
   .\combine_chapters.ps1 -ChapterDir "..\Chapters" -OutputPath "..\Manuscript\COMBINED.md"
   ```

2. **Generate Word Document**:
   ```batch
   generate_docx.bat "..\Manuscript\COMBINED.md" "..\Manuscript\BOOK.docx"
   ```

3. **Prepare Word Template**:
   ```powershell
   .\prepare_word_template.ps1 -TemplateFile "reference.docx" -OutputFile "..\Manuscript\template.docx"
   ```

## Integration with Memory Bank

These production tools work seamlessly with the memory bank's automatic update system. As you write new chapters, the memory bank maintains your book's context, and when you're ready to publish, these production tools help transform your writing into a professional manuscript.
