# Auto-Update NextChapter.md Workflow

This workflow automatically customizes the NextChapter.md file based on the current memory bank files (style_guide.md and world_and_characters.md). No manual input required.

## Prerequisites 

**IMPORTANT**: This automation only works when your memory bank files contain actual book data, not template placeholders. Before running the auto-update:

1. ✅ Memory bank files should be populated with real book details
2. ✅ Characters should have actual names and documented voice patterns  
3. ✅ Style guide should contain your specific POV, genre, and narrative choices
4. ✅ Project brief should have your actual book's genre, setting, and protagonist details

If your memory bank still contains templates like `[Your Book Title]` or `[Character Name]`, populate those first, then run this automation.

## Auto-Update Prompt

```
Please automatically update the .clinerules/workflows/NextChapter.md file based on the current memory bank files. 

IMPORTANT: You must UPDATE the existing NextChapter.md file using replace_in_file operations. Do NOT create a new file.

VALIDATION STEP:
First, check if the memory bank files contain actual book data or just template placeholders:
- If files contain templates like [Your Book Title], [Character Name], [Primary Genre], etc., inform the user that the memory bank needs to be populated first before automation can work effectively.
- If files contain real book data, proceed with the automation.

EXAMPLE OF UPDATING METHOD:
Use replace_in_file operations to directly modify .clinerules/workflows/NextChapter.md like this:
- Find each [PLACEHOLDER] in the NextChapter.md file
- Replace it with the actual extracted information
- Preserve ALL existing workflow structure and logic

PROCESS:
1. Read book-memory-bank/Style/style_guide.md
2. Read book-memory-bank/Core/world_and_characters.md  
3. Read book-memory-bank/Core/projectbrief.md
4. Extract all relevant book-specific information
5. Use replace_in_file operations to directly UPDATE the existing .clinerules/workflows/NextChapter.md file
6. Replace ALL placeholder brackets [LIKE_THIS] with actual information while preserving all critical workflow logic

AUTOMATIC EXTRACTION TARGETS:

From projectbrief.md:
- Extract PROTAGONIST name
- Extract GENRE 
- Extract SETTING/WORLDBUILDING details
- Extract POV and TENSE information

From style_guide.md:
- Extract POV/TENSE specifics
- Extract NARRATIVE-TECHNIQUE details  
- Extract DIALOGUE STYLE requirements
- Extract GENRE-SPECIFIC style elements
- Extract key characteristic that affects narrative
- Extract atmospheric requirements (sounds, smells, touch, sight)

From world_and_characters.md:
- Extract all CHARACTER_NAME entries with their:
  - Key speech patterns and vocabulary
  - Emotional/psychological markers in dialogue
  - Character-specific mannerisms and expressions
  - Voice evolution throughout story arc
- Extract SETTING atmospheric details
- Extract WORLDBUILDING elements
- Extract cultural elements
- Extract perceptual filters

REPLACEMENT RULES:
- Replace [PROTAGONIST] with the actual protagonist name
- Replace [GENRE] with the actual genre
- Replace [SETTING] with the actual setting
- Replace [POV] with the actual POV
- Replace [TENSE] with the actual tense  
- Replace [POV/TENSE] with the combined POV and tense
- Replace [NARRATOR] with the actual narrator name
- Replace [NARRATIVE-TECHNIQUE] with the actual narrative technique
- Replace [key characteristic] with the protagonist's defining trait
- Replace [key state/condition] with the specific condition to track
- Replace [WORLDBUILDING] with specific worldbuilding elements
- Replace [THEMATIC] with thematic elements
- Replace [GENRE-SPECIFIC] with genre-specific elements
- Replace [STYLE-SPECIFIC elements] with style-specific elements
- Replace [genre techniques] with specific genre techniques
- Replace [genre-specific quality markers] with quality markers
- Replace [genre-specific techniques] with specific techniques
- Replace all [CHARACTER_NAME] sections with actual character details
- Replace all bracketed atmospheric elements with actual details

CRITICAL: Use replace_in_file operations to UPDATE the existing .clinerules/workflows/NextChapter.md file. Do NOT create a new file or separate customization file.

UPDATE METHOD:
- Use multiple replace_in_file operations to systematically replace each placeholder section
- Preserve ALL existing workflow structure, quality controls, and critical instructions
- Only replace the bracketed placeholders [LIKE_THIS] with actual book details
- Maintain all formatting, headings, and workflow logic

SPECIFIC UPDATE TARGETS:
1. Replace [PROTAGONIST] placeholders with actual protagonist name
2. Replace [GENRE] placeholders with actual genre
3. Replace [SETTING] placeholders with actual setting details  
4. Replace [POV/TENSE] combinations with actual POV and tense
5. Update the "Character Voice Authenticity" section with ALL characters from world_and_characters.md
6. Update the "Atmospheric Integration Requirements" section with specific environmental details
7. Update the "[GENRE] Style Integration" section with specific style elements
8. Update the "[POV] Requirements" section with specific narrative technique details
9. Update all quality checklists with book-specific details
10. Update monitoring sections with actual character names and specific elements to track

PRESERVE:
- All workflow steps and their order
- All quality verification processes  
- All pre-writing and post-writing checks
- All revision protocols
- The complete structure that ensures "every 'next chapter' is planned, drafted, and quality-verified in one seamless process"

After completing all replace_in_file operations, provide a summary of what specific details were extracted and applied to customize the workflow.
```

## Usage Instructions

### Step 1: Ensure Memory Bank is Populated
Before using this automation, verify your memory bank files contain real data:

**Check projectbrief.md for**:
- Actual book title (not `[Your Book Title]`)
- Real genre (not `[Primary Genre]`)  
- Actual protagonist name
- Specific setting details

**Check world_and_characters.md for**:
- Character profiles with real names
- Documented speech patterns and dialogue styles
- Specific worldbuilding details
- Cultural and atmospheric elements

**Check style_guide.md for**:
- Defined POV and tense
- Narrative voice specifications
- Genre-specific style elements
- Dialogue formatting preferences

### Step 2: Run Auto-Update
Once your memory bank is populated, simply paste the auto-update prompt above to Cline.

### Step 3: Review Results
Cline will provide a summary of what specific details were extracted and applied to customize the workflow.

## When to Use

- **After memory bank initialization** with your book's specific details
- **After significant updates** to style_guide.md or world_and_characters.md
- **When character voices evolve** and need to be reflected in the workflow
- **When atmospheric details are refined** and should be incorporated
- **Periodically** to ensure the workflow stays synchronized with your book's current state

## Benefits

- **Zero manual customization required** - fully automated extraction and replacement
- **Always current** - reflects your latest memory bank updates
- **Comprehensive** - updates all sections, checklists, and quality verification steps
- **Consistent** - ensures workflow always matches your book's documented characteristics

This system transforms the generic NextChapter.md template into a book-specific quality control workflow automatically based on your documented book details.
