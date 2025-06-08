# Book Memory Bank

A structured documentation system for maintaining context and consistency throughout the book writing process. This memory bank helps writers work with LLM assistants by providing a persistently updated knowledge base that enables a stateless AI to maintain full context across writing sessions.

## Overview

The Book Memory Bank is designed to solve a key challenge when writing books with AI assistance: maintaining consistent context. It consists of:

1. **Core documentation files** for story elements
2. **Specialized templates** for characters, plot, and world building
3. **Automation scripts** for manuscript preparation
4. **Workflow guidelines** for effective AI collaboration
5. **Custom instructions** for LLM assistants
6. **Conversational memory updating** that eliminates the need for scripts

## Complete Project Structure

The recommended project structure separates the memory bank (metadata and context) from the actual book content:

```
YourBookProject/              # Root project directory
├── .clinerules                # Cline configuration file
├── Chapters/                  # ACTUAL chapter files
│   └── Chapter01.md
│   └── Chapter02.md
├── Outlines/                  # ACTUAL outlines
│   ├── Master_Outline.md
│   └── Chapter_Outlines/
│       └── Chapter01_Outline.md
├── Manuscript/                # Generated output files
└── book-memory-bank/          # Memory bank files (context only)
    ├── README.md              # Memory bank documentation (this file)
    ├── memory_bank_workflow.md # How to use the memory bank
    ├── custom_instructions.md  # AI assistant instructions
    ├── llm_memory_updating_guide.md # Guide for automated memory updates
    ├── memory_update_prompts.md # Pre-written prompts for updates
    ├── memory_auto_update_quickstart.md # Quick start for auto updates
    ├── auto_memory_workflow.md  # Automated workflow guide
    ├── cline_memory_auto_instructions.md # Instructions for auto updates
    │
    ├── Core/                   # Core story documentation
    │   ├── projectbrief.md     # Core project definition
    │   ├── storyContext.md     # Book purpose and reader experience
    │   ├── narrativePatterns.md # Storytelling approach and style
    │   ├── worldContext.md     # Worldbuilding elements
    │   ├── activeContext.md    # Current work status
    │   ├── progress.md         # Completion tracking
    │   └── character_profiles.md # Character development and tracking
    │
    ├── Characters/             # Character development directory (placeholder)
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
        ├── Publishing/         # Publication resources
        │   ├── revision_checklist.md # Systematic review guidelines
        │   ├── marketing_plan.md # Book marketing strategies
        │   └── kdp_publishing_guide.md # Publishing instructions
        │
        └── Scripts/            # Automation tools
            ├── combine_chapters.ps1 # Merge chapters into one document
            ├── extract_chapter_information.ps1 # Extract data from chapters
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

The foundation of the memory bank consists of seven core files located in the Core/ directory:

1. **projectbrief.md** - High-level concept, scope, and goals
2. **storyContext.md** - Purpose, positioning, and reader experience
3. **narrativePatterns.md** - Story structure, techniques, and stylistic choices
4. **worldContext.md** - Worldbuilding elements and rules
5. **activeContext.md** - Current work focus and near-term plans
6. **progress.md** - Project tracking and completion status
7. **character_profiles.md** - Character development and tracking

These files build upon each other in a hierarchical structure, moving from foundational elements to current status.

## Automated Memory Updating

The Book Memory Bank features fully automated updates through Cline's built-in file access capabilities—no scripts or manual updates required:

### Direct Conversational Updates

Cline can automatically maintain your memory bank by:

1. Reading the latest chapter content
2. Identifying new information about characters, world, and plot elements
3. Directly updating all relevant memory bank files
4. Providing a summary of all changes made

This approach leverages Cline's file access to completely automate the memory bank maintenance process with minimal user intervention - no scripts needed, just conversation.

### Using Memory Bank Update Prompts

With specially crafted prompts, you can trigger automatic memory bank updates for both completed chapters and outlines:

#### For Completed Chapters:
```
I've just completed Chapter 5: The Revelation. 

Please:
1. Read the entire chapter content
2. Identify all new information about characters, world elements, and plot developments
3. Automatically update all relevant memory bank files
4. Provide a summary of the updates you've made
```

#### For Chapter Outlines:
```
I've just completed the outline for Chapter 5: The Revelation.

Please:
1. Read the entire outline
2. Identify planned story elements, characters, and world-building components
3. Update all relevant memory bank files with this planned information
4. Mark these elements as "planned" (vs. "established") where appropriate
5. Provide a summary of the updates you've made
```

Cline will analyze the content, identify important information, and directly update all memory bank files without requiring you to run any scripts.

### Consistency Checking and Audits

You can also request automatic consistency checks:

```
Please perform a comprehensive memory bank consistency check.

1. Review all memory bank files for internal consistency
2. Check for contradictions between different memory bank files
3. Verify that character arcs align with plot developments
```

For a complete collection of memory update prompts, see the [Memory Update Prompts](./memory_update_prompts.md) guide.

### Custom Instructions for Automatic Updates

The memory bank includes [enhanced custom instructions](./cline_memory_auto_instructions.md) that configure Cline to automatically monitor for new content and maintain the memory bank without requiring explicit commands.

## Workflow Guide

The system supports three primary workflows:

### Initial Planning Workflow
1. Start in **Plan Mode** with high-level concept discussions
2. Extract key elements and populate core files
3. Develop character profiles and world building
4. Create master outline and chapter structure

### Chapter Development Workflow
1. Write individual chapters in the Chapters/ directory
2. Tell Cline: "I've completed Chapter X. Please update the memory bank."
3. Review Cline's summary of updates made to all relevant memory bank files
4. Continue with the next chapter based on the updated memory bank

### Publishing Preparation Workflow
1. Use Production/Publishing/revision_checklist.md to systematically review the manuscript
2. Run Production/Scripts/combine_chapters.ps1 to assemble the complete book
3. Use Production/Scripts/generate_docx.bat to create a properly formatted Word document
4. Follow Production/Publishing/kdp_publishing_guide.md for publication steps

## Getting Started

1. **Set up the Project Structure**:
   - Copy the book-memory-bank folder to your project directory
   - Create the Chapters/, Outlines/ and Manuscript/ directories
   - Create .clinerules file with content from custom_instructions.md
   - Ensure all paths in the .clinerules file include "book-memory-bank/" prefix

2. **Configure AI Assistant**:
   - Copy the contents of custom_instructions.md to your LLM's custom instructions
   - Ensure file paths in custom instructions include "book-memory-bank/" prefix
   - Open VSCode in your main project directory

3. **Start Your Project**:
   - Begin in Plan Mode to establish basic story elements
   - Populate book-memory-bank/Core/projectbrief.md and related core files
   - Develop character profiles and master outline
   - Create chapter outlines in the Outlines/ directory

4. **Writing Process**:
   - Write chapters in the Chapters/ directory using the LLM for assistance
   - After each chapter, simply tell Cline: "I've completed Chapter X. Please update the memory bank."
   - Review Cline's summary of automatic updates
   - Continue writing with Cline's assistance, leveraging the updated memory bank

5. **Publishing Preparation**:
   - Run the automation scripts in the Production/Scripts directory to assemble and format your manuscript
   - Follow the publishing guidelines in Production/Publishing for your chosen platform

## Example Usage

### Memory Bank Initialization
```
I want to start a new novel about [concept]. Let's begin by setting up the memory bank.
```

### Chapter Completion and Memory Update
```
I've completed Chapter 3. Please analyze it for new information and update the memory bank files automatically.
```

### Consistency Check
```
Are there any consistency issues between the character development in Chapter 5 and their established profile?
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
