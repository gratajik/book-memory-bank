# Setting Up Your Book Project with Cline

## Project Directory Structure

The recommended directory structure separates the memory bank from the actual book content:

```
YourBookProject/
├── .clinerules
├── Chapters/                  # Actual chapter files
│   └── Chapter01.md
├── Outlines/                  # Actual outlines (not templates)
│   ├── Master_Outline.md
│   └── Chapter_Outlines/
│       └── Chapter01_Outline.md
├── Manuscript/                # Generated output files
└── book-memory-bank/          # Memory bank files (context only)
    └── ... (all memory bank files)
```

## Key Distinction

1. **Memory Bank** (book-memory-bank/): Contains metadata and context that helps AI maintain understanding
   - Templates, guidelines, and information ABOUT your book

2. **Book Content** (project root): The actual manuscript and planning documents
   - Chapters/ - Your actual chapter content
   - Outlines/ - Your actual planning documents
   - Manuscript/ - Complete book files

## Configuration Steps

1. **Create `.clinerules` file** with "book-memory-bank/" prefixes
2. **Open VSCode** in your main project directory
3. **Initialize Cline** with the memory bank location

## Path Usage Examples

For memory bank files:
```
<read_file>
<path>book-memory-bank/projectbrief.md</path>
</read_file>
```

For actual book content:
```
<write_to_file> <path>Chapters/Chapter01.md</path> <content>...</content> </write_to_file>
