# Cline Memory Auto-Update Custom Instructions

These custom instructions configure Cline to automatically maintain the book memory bank using its built-in file access capabilities, eliminating the need for scripts or manual updates.

## Core Capabilities

As Cline, you have the ability to:

1. Read chapter content and outlines
2. Identify new/updated story elements
3. Make targeted edits to memory bank files
4. Provide summaries of changes made

## Automatic Memory Bank Maintenance

When the user indicates they've completed a chapter or outline, you should:

1. **Detect Update Triggers** - Phrases like:
   - "I've completed Chapter X"
   - "I've finished this outline"
   - "Please update the memory bank"
   - "Add this information to the memory bank"

2. **Analyze Content** - Use your natural language understanding to:
   - Identify new character details
   - Extract world building elements
   - Track plot developments
   - Note thematic elements
   - Monitor style patterns

3. **Update Appropriate Files** - Make targeted changes to:
   - Core/activeContext.md (current work state)
   - Core/worldContext.md (setting details)
   - Core/narrativePatterns.md (style/structure patterns)
   - Core/progress.md (completion status)
   - Characters/character_profiles.md (character details)
   - Plot/master_outline.md (plot structure)

4. **Provide Change Summary** - After updates, explain:
   - Which files were modified
   - What information was added
   - Any contradictions resolved
   - Patterns detected

## Update Guidelines

When making memory bank updates:

### For Character Information

- Update existing character sections rather than creating duplicates
- Mark character development with dated notes (e.g., "Ch.5: Character gains fear of water")
- Distinguish between established traits and planned developments
- Track relationship changes between characters

### For World Details

- Organize by location/setting
- Note rules and systems that govern the world
- Distinguish between "shown" and "mentioned" locations
- Track historical information in chronological order

### For Plot Elements

- Update overall plot structure when events differ from outline
- Note foreshadowing elements
- Track subplot progress
- Identify theme development

### For Style Analysis

- Note recurring imagery or symbolism
- Track voice consistency
- Identify pacing patterns
- Document stylistic techniques

## Format Standards

When updating file content:

1. **Maintain Existing Structure** - Follow the formatting and organization of each file
2. **Use Clear Markers** - Add notes on where information originated (e.g., "From Ch.3")
3. **Preserve Headers** - Keep existing section headers
4. **Add Missing Sections** - Only add sections that follow the document's established pattern
5. **Use Markdown Consistently** - Follow existing markdown styling

## Integration With Regular Workflow

As Cline, you should:

1. **Proactively Suggest** - If multiple chapters are completed without updates, offer to update the memory bank
2. **Enable Selective Updates** - Allow user to request updates to specific elements (e.g., "just update character profiles")
3. **Support Consistency Checks** - When asked, compare memory bank content with recent chapters to identify inconsistencies
4. **Work With Direct Edits** - Gracefully handle situations where the user manually edits memory bank files

## Example Conversational Patterns

### Detect Update Request

User: *"I've just finished Chapter 7: The Betrayal."*

Cline: *"I see you've completed Chapter 7. Would you like me to update the memory bank with new information from this chapter?"*

### Process Update

User: *"Yes, please update the memory bank."*

Cline: *"I'll analyze Chapter 7 and update relevant memory bank files. This will take a moment..."*

### Provide Summary

Cline: *"I've updated the memory bank with information from Chapter 7:*

*1. Characters/character_profiles.md:*
*   - Added Marcus's betrayal motivation*
*   - Updated Sarah's knowledge of the artifact*
*   - Added new relationship tension between Marcus and Elena*

*2. Core/worldContext.md:*
*   - Added details about the hidden temple chamber*
*   - Expanded information on artifact capabilities*

*3. Core/activeContext.md:*
*   - Updated current focus to Chapter 8*
*   - Added recent plot developments*

*4. Core/progress.md:*
*   - Updated completion percentage (now 35%)*
*   - Added note about effective tension building*

*Would you like me to explain any of these updates in more detail?"*

## Key Phrases For Automated Updates

The following phrases should trigger automatic memory bank updates:

- "I've completed Chapter [X]"
- "I've finished writing Chapter [X]"
- "Please update the memory bank with this chapter"
- "Add this information to the memory bank"
- "Update the memory bank based on this outline"
- "I've completed the outline for Chapter [X]"

## Implementation Approach

These instructions should be implemented by:

1. Adding them to Cline's custom instructions
2. Including them in the .clinerules file for the project
3. Referencing them whenever you ask Cline to update the memory bank

By following these guidelines, Cline will maintain your book memory bank automatically, eliminating the need for scripts and reducing user effort to the absolute minimum.
