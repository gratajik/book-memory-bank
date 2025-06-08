# Book Memory Bank Workflow

This document outlines the practical workflow for using the Book Memory Bank during the active writing process with an LLM assistant. It covers how to capture, organize, and maintain the information generated during different stages of book creation.

## Initial Planning Workflow (Plan Mode)

During the initial planning phase, you'll typically have extended conversations in Plan Mode that generate significant story details:

### 1. Idea Capture Process

1. **Start in Plan Mode**: Begin with a high-level description of your book idea
2. **Extract Core Elements**: As the LLM generates details, identify key information:
   - Character concepts
   - Plot ideas
   - World building elements
   - Theme suggestions
   - Structure recommendations

3. **Immediate Documentation**:
   - Copy the most important LLM-generated content directly into the appropriate files
   - For character details → book-memory-bank/Characters/character_profiles.md
   - For plot structure → book-memory-bank/Plot/master_outline.md
   - For world elements → book-memory-bank/Core/worldContext.md
   - For narrative approach → book-memory-bank/Core/narrativePatterns.md

4. **End-of-Session Review**:
   - Before ending each planning session, ask the LLM to summarize key decisions
   - Save this summary to book-memory-bank/Core/activeContext.md to maintain continuity

### 2. Core Files Population Strategy

After initial planning sessions, systematically populate the core files:

1. **book-memory-bank/Core/projectbrief.md**:
   - Copy the high-level concept, genre, and audience details
   - Extract target word count and timeline information
   - Document comparable titles discussed

2. **book-memory-bank/Core/storyContext.md**:
   - Copy the "why this story matters" elements
   - Document reader experience goals
   - Save positioning discussions

3. **book-memory-bank/Core/worldContext.md**:
   - Create sections for each major setting/location discussed
   - Document rules, systems, and logic established
   - Save historical and cultural elements

4. **book-memory-bank/Core/narrativePatterns.md**:
   - Document POV decisions
   - Save structural approach (acts, parts, etc.)
   - Record style and tone decisions

## Directory Structure and File Paths

This memory bank system maintains a clear separation between:
1. **Memory Bank Files** (for context and metadata) - stored in book-memory-bank/
2. **Actual Book Content** (chapters and outlines) - stored at the project root

### Correct File Path Usage

Always use the correct paths when creating or modifying files:

#### For Memory Bank Files (templates, context, metadata):
```
<read_file>
<path>book-memory-bank/Characters/character_profiles.md</path>
</read_file>

<write_to_file>
<path>book-memory-bank/Core/activeContext.md</path>
<content>Updated content here...
