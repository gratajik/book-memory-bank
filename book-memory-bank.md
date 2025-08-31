# Book Memory Bank

A structured documentation system for maintaining context and consistency throughout the book writing process. This memory bank helps writers work with LLM assistants by providing a persistently updated knowledge base that enables a stateless AI to maintain full context across writing sessions.

NOTE: This was last tested with Opus 4.1. Different models may behave differently. 

## Overview

The Book Memory Bank is designed to solve a key challenge when writing books with AI assistance: maintaining consistent context. It consists of:

1. **Core documentation files** for story elements
2. **Specialized templates** for characters, plot, and world building
3. **Automation scripts** for manuscript preparation
4. **Workflow guidelines** for effective AI collaboration
5. **Custom instructions** for LLM assistants
6. **Conversational memory updating** that eliminates the need for scripts

## Getting Started

1. **Start Your Project**: 
   - Copy the book-memory-bank folder to your project directory
   - Open VSCode in your main project directory
   - Begin in Plan Mode to establish basic story elements   
   - Describe what you want to write. Make the first line meaningful, as that's what will show up in Clines history. 
   - Add detail - at any level you want. You can start with a basic description and then iterate - or add as much detail as you want. This might include main character(s), 1st or 3rd perspective, tone, plot points, locations, et al.  It's recommend to set the over all style of the book. For example, "Write this book in the style of Ernest Hemingway" - or "Write this book with a style of minimalist and direct, using simple language, short sentences, and subtle implication to convey deep meaning through action and dialogue" (which somewhat equates to how Hemingway wrote)
   - Answer any questions given to you.
   - Prompt  `Setup the root .clinerules directory, seeding from those in memory bank`. This will create the .clinerules (and files)   

2. **Writing Process**:
   - Once you are ready to start writing the book, writing to Act mode.
   - It should have update the memory book files (this will take a while!)
   - It is CRITICAL to develop style - of the book, and each character. If each character doesn't have their own voice, the book won't be very good. Suggestions:   
      - You can play act with the AI (you can do this for each character)
         - Ask it 
         ```
         Pretend I am character X. Interview me to get to know me better. Ask follow up questions, until you feel like you really know me or I say I'm done.  Update style_guide.md with what you learned.
         ```

         - Ask it
         ```
         Pretend YOU are character X and act out a scene for me, behaving as you believe the character would, with their style. I will provide feedback - alter the character as I do. Once the session is done, update style_guide.md
         ```

   - As for the master outline to be written. Review and feedback changes (if needed)
   - Once the master outline is how you want it, "update memory bank". This will make sure to your start with a updated memory bank
   - You can iterate how you want at this point. The pattern that seems to work the best:
      1.  `/NextChapter`   (NOTE: If it has problems running this, use `Run /NextChapter`)      
      4.  Review and feedback changes
      5.  `/UpdateMemoryBank`
      6.  Repeat until the book is complete
   
   - It's recommend to read and feedback on each chapter as they are written - you can always make major changes  later (by prompting for it!), but it will take a while and can be error-prone
   - Periodically review all memory bank files - if you see a problem, enter a prompt to correct   

3. **Publishing Preparation**:
   - Run the automation scripts in the Production/Scripts directory to assemble and format your manuscript   

## Complete Project Structure

The recommended project structure separates the memory bank (metadata and context) from the actual book content:

```
YourBookProject/              # Root project directory
├── .clinerules/               # Cline rules
├── └── book-memory-bank.md    # Cline rules for book-memory
├── └── author-rules.md        # Cline rules to behave like a human author
├── └── workflows              # Common workflows
├── └── └── NextChatper.md     # Main driver to create new chapters
├── └── └── UpdateMemoryBank.md # Helper to update memory bank
├── └── └── CheckStyle.md      # If NextChapter isn't doing well with style, run this AFTER a chapter is written
├── └── └── AutoUpdate_NextChapter.md # NextChapter must be updated with book-specific info to pick up style correctly. This should auto happen - if not, run this
├── Chapters/                  # ACTUAL chapter files
│   └── Chapter01.md
│   └── Chapter02.md
├── Outlines/                  # ACTUAL outlines
│   ├── Master_Outline.md
│   └── Chapter_Outlines/
│       └── Chapter01_Outline.md
|── AI Generation/             # ACTUAL AI Generation
│   ├── cover_prompts.md       # ACTUAL cover prompts   
├── Manuscript/                # Generated output files
└── book-memory-bank/          # Memory bank files (context only)
    ├── README.md              # Memory bank documentation (this file)   
    |── system_prompt.md       # Suggested system prompt - in Cline, go to Settings and paste the content of that into "Custom Prompt" 
    ├── custom_instructions.md  # AI assistant instructions     
    │
    ├── Core/                   # Core story documentation
    │   ├── projectbrief.md     # Core project definition
    │   ├── story_structure.md  # Story purpose, positioning and narrative patterns
    │   ├── world_and_characters.md # Worldbuilding elements and character profiles
    │   ├── activeContext.md    # Current work status
    │   └── progress.md         # Completion tracking
    │
    ├── Core/Templates/         # Template files for new content
    │   ├── README.md           # Guide to using templates
    │   ├── master_outline_template.md  # Story structure template
    │   └── chapter_outline_template.md # Chapter planning template
    │
    ├── Style/                  # Writing guidelines
    │   └── style_guide.md
    │
    └── Production/             # Book production resources
        ├── README.md           # Guide to using production tools
        │
        ├── AI_Generation/      # AI prompt templates
        │   └── cover_prompts.md # Instructions for AI cover generation
        │
        │
        └── Scripts/            # Automation tools
            ├── combine_chapters.ps1 # Merge chapters into one document            
            ├── generate_docx.bat # Create Word document
            └── prepare_word_template.ps1 # Setup Word formatting
```

### Key Distinction

1. **Memory Bank** (book-memory-bank/): Contains metadata and context that helps AI maintain understanding
   - Templates, guidelines, and information ABOUT your book (not the book itself)

2. **Book Content** (project root): The actual manuscript and planning documents
   - Chapters/ - Your actual chapter content
   - Outlines/ - Your actual planning documents
   - Manuscript/ - Complete book files

## Core Files

The foundation of the memory bank consists of five core files located in the Core/ directory:

1. **projectbrief.md** - High-level concept, scope, and goals
2. **story_structure.md** - Purpose, positioning, reader experience, and narrative techniques
3. **world_and_characters.md** - Worldbuilding elements, rules, and character profiles
4. **activeContext.md** - Current work focus and near-term plans
5. **progress.md** - Project tracking and completion status

These files build upon each other in a hierarchical structure, moving from foundational elements to current status.

## Automated Memory Updating

The Book Memory Bank features fully automated updates through Cline's built-in file access capabilities—no scripts or manual updates required:

### Memory Bank Initialization
```
I want to start a new novel about [concept]. Let's begin by setting up the memory bank.
```

### Basic full update

Most of the time you will just ask to update memory bank - this should pick up all changes and update the correct files.  If this is not working, you can use the other Automatic Content Analysis Prompts - the most used will be update:

```
update memory bank
```


### Publishing Preparation Workflow
```
Create front matter, copyright page, and back matter
```

```
I am ready to create a high quality docx that I will use to submit to KDP. You already have files to do this - the main driver is generate_docx.bat
```

### Consistency Checking and Audits

You can also request automatic consistency checks:

```
Please perform a comprehensive memory bank consistency check.

1. Review all memory bank files for internal consistency
2. Check for contradictions between different memory bank files
3. Verify that character arcs align with plot developments
```

### Advanced Consistency Check (NOTE: This will very time-consuming and token-heavy (e.g., may cost a lot) so use with care! "ultrathink" may only work with Claude
```
Do this for the entire book. Make sure to actually load each chapter to check these!

Using memory-bank, and these files and directories
book-memory-bank/Core/world_and_characters.md
book-memory-bank/Style/style_guide.md 
Outlines/Master_Outline.md
Chapters/


ultrathink: Think about and verify the below:

- Ensure style follows the Style Guide and character styles in world_and_characters.md
- Ensure plot consistency across all chapters
- Verify timeline accuracy and logical progression
- Confirm character motivations remain consistent
- Check for plot holes or unresolved story threads
- Check for any legal issues that this book might have
- Confirm consistency in locations, timing, and character movements
- Review for inadvertent contradictions or continuity errors
- Verify scientific details for accuracy
```

## Benefits

- **Continuity**: Maintains consistent story elements across writing sessions
- **Efficiency**: Automates tedious documentation and formatting tasks
- **Consistency**: Ensures character, plot, and world details remain coherent
- **Collaboration**: Enables effective teamwork between human and AI
- **Organization**: Provides clear structure for complex storytelling
- **Simplicity**: Updates happen through natural conversation, not scripts

## Advanced Features

- **Extract Information Script**: Pulls structured data from completed chapters
- **Conversational Memory Updates**: Simply tell Cline to update the memory bank
- **Document Generation**: Creates properly formatted manuscript files
- **Revision Framework**: Provides systematic approach to manuscript improvement

By using the Book Memory Bank, you transform the stateless nature of LLM interactions into a persistent, context-aware writing partnership that maintains full knowledge of your evolving book project.