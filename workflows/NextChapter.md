## Enhanced Next Chapter Workflow - Quality-Integrated

**Purpose**: This workflow ensures every "next chapter" is planned, drafted, and quality-verified in one seamless process, eliminating the need for separate quality checks.

**Key Enhancement**: Quality analysis and style guide compliance are integrated directly into the writing process, not added afterward.

---

## PRE-WRITING VERIFICATION (MANDATORY)

### Checkpoint A: Story Continuity
1) Read the last written chapter (e.g., Chapters/Chapter_NN.md).
2) State clearly in your preface:
   - **Where**: exact location where the previous chapter ended
   - **When**: time of day / date / story timeline position
   - **State**: [PROTAGONIST]'s physical/mental/emotional state
   - **Knowledge**: 3 key things [PROTAGONIST] knows at this point

### Checkpoint B: Chapter Planning
1) Read Outlines/Master_Outline.md.
2) State clearly:
   - "This chapter should cover: [main events from outline]"
   - "Key plot points to include: [list them]"
   - "Chapter should end with: [ending hook from outline]"

### Checkpoint C: Style & Character Quality Verification ⭐ **ENHANCED**
1) Read book-memory-bank/Style/style_guide.md
2) Read book-memory-bank/Core/world_and_characters.md
3) **Character Voice Requirements Check**:
   - Review documented speech patterns for each character appearing in this chapter
   - Verify character-specific language, vocabulary, and dialogue styles
   - Check character emotional/psychological state progression
   - Confirm relationship dynamics and how they affect dialogue
   - Ensure character voice evolution matches their story arc progression
4) **Genre & Atmosphere Requirements**:
   - [SETTING] atmospheric details ready (specific environmental elements)
   - [GENRE-SPECIFIC] elements planned (tone, mood, style markers)
   - [WORLDBUILDING] details prepared for scenes
   - [THEMATIC] elements ready to weave throughout
5) **[POV] Style Requirements**:
   - [NARRATOR] voice prepared (specific narrative style)
   - Dialogue style consistent with established patterns
   - Sensory details appropriate to POV character's perspective
   - [NARRATIVE-TECHNIQUE] elements ready
6) **CRITICAL**: If ANY file shows "content removed to save space," STOP and notify the user. Do not proceed with incomplete information.

---

## QUALITY-INTEGRATED WRITING REQUIREMENTS ⭐ **NEW SECTION**

### Mandatory Quality Elements to Weave Throughout:

#### **Character Voice Authenticity**
[CHARACTER-SPECIFIC VOICE PATTERNS - To be customized per book]
- **[CHARACTER_NAME]**: 
  - [Key speech patterns and vocabulary]
  - [Emotional/psychological markers in dialogue]
  - [Character-specific mannerisms and expressions]
  - [Evolution of voice throughout story arc]

#### **Atmospheric Integration Requirements**
[SETTING-SPECIFIC ATMOSPHERIC ELEMENTS - To be customized per book]
- **Every scene should include**:
  - **Sound**: [Specific environmental sounds for your setting]
  - **Smell**: [Characteristic scents of your world/setting]
  - **Touch**: [Tactile details relevant to your genre/setting]
  - **Sight**: [Visual elements that reinforce mood and atmosphere]
- **[GENRE/SETTING] Culture**: [Key cultural elements that should appear regularly]

#### **[GENRE] Style Integration**
[GENRE-SPECIFIC STYLE ELEMENTS - To be customized per book]
- **[Style Element 1]**: [Description of how this appears in prose]
- **[Style Element 2]**: [Description of integration method]
- **[Style Element 3]**: [Description of specific techniques]
- **[Style Element 4]**: [Description of quality markers]

#### **[POV] Requirements**
[POV-SPECIFIC NARRATIVE TECHNIQUES - To be customized per book]
- **[NARRATOR]'s [Voice Quality]**: [Specific narrative voice characteristics]
- **[Dialogue Style]**: [Specific approach to dialogue formatting/structure]
- **[Sensory Integration]**: [How sensory details are filtered through POV]
- **[Character Positioning]**: [Physical and emotional positioning techniques]

---

## REAL-TIME QUALITY MONITORING DURING WRITING

### As You Write Each Scene, Verify:
- [ ] Is [PROTAGONIST]'s [key state/condition] consistent with story progression?
- [ ] Are atmospheric details woven naturally into action, not just described?
- [ ] Does each character's dialogue sound distinct and match their documented patterns?
- [ ] Are [GENRE-SPECIFIC] elements present without overwhelming the narrative?
- [ ] Is [POV] maximized with [PROTAGONIST]'s internal reactions/thoughts?

---

## POST-WRITING QUALITY VERIFICATION ⭐ **BEFORE FILE SAVE**

### Quality Checkpoint (Complete Before Saving Chapter):
1) **Character Voice Audit**:
   [CHARACTER-SPECIFIC VOICE VERIFICATION - To be customized per book]
   - [CHARACTER]'s [key voice characteristics] applied correctly?
   - [CHARACTER]'s [signature speech patterns] appropriate for their current state?
   - [CHARACTER]'s [distinctive elements] included naturally?
   - [All other major characters - customize per book]

2) **Atmospheric Depth Check**:
   [SETTING-SPECIFIC ATMOSPHERE VERIFICATION - To be customized per book]
   - [SETTING] details integrated in every scene?
   - [GENRE-SPECIFIC atmospheric elements] present naturally?
   - [POV CHARACTER]'s [perceptual filter] consistent throughout?
   - Sensory details (minimum 2 senses per scene)?

3) **Style Authenticity Verification**:
   [POV/STYLE-SPECIFIC CHECKS - To be customized per book]
   - [POV/TENSE] maintained throughout?
   - [DIALOGUE STYLE] with sufficient [narrative technique]?
   - [PROTAGONIST]'s [key characteristic] balance present?
   - [STYLE-SPECIFIC elements] integrated appropriately?

4) **[GENRE] Integration**:
   [GENRE-SPECIFIC QUALITY CHECKS - To be customized per book]
   - [Genre element 1] maintained consistently?
   - [Genre element 2] behaving according to established rules?
   - [Genre element 3] present without overwhelming narrative?
   - [Genre element 4] integrated naturally?

### **AUTO-REVISION PROTOCOL**:
If any quality element is missing or weak:
- **STOP** before saving chapter
- **IDENTIFY** specific areas needing improvement
- **REVISE** those sections immediately using replace_in_file
- **RE-CHECK** quality before proceeding

------

## OUTPUT TARGETS (MANDATORY)  

### 1) Write Enhanced Chapter to File (REQUIRED)
- Path: Chapters/Chapter_NN_Title.md (e.g., Chapter_17_Fork_Bomb.md)
- **Quality Requirement**: Chapter must pass all quality checkpoints above
- Use write_to_file with the full, quality-verified chapter content

### 2) Update Memory Bank (OPTIONAL - Only if significant story developments)
- Update book-memory-bank/Core/activeContext.md
- Update book-memory-bank/Core/progress.md  
- Update book-memory-bank/Core/world_and_characters.md ONLY IF new character details added

### 3) Quality Completion Report (REQUIRED)
Provide summary confirming:
- ✅ Character voice authenticity verified for all speaking characters
- ✅ [PROTAGONIST]'s [key characteristic] consistently applied
- ✅ Atmospheric details integrated throughout ([SETTING])
- ✅ [GENRE] style elements present
- ✅ [POV] maximized with [narrative technique]
- ✅ [GENRE-SPECIFIC elements] appropriately balanced

---

## QUALITY FAILURE PROTOCOLS

### If Chapter Doesn't Meet Quality Standards:
1) **Do NOT save the chapter file yet**
2) **Identify specific quality issues**:
   - Missing character voice elements
   - Lacking atmospheric details  
   - Weak [POV] utilization
   - Script-like dialogue without [narrative technique]
   - [PROTAGONIST]'s [key characteristic] inconsistency
3) **Revise immediately** using replace_in_file
4) **Re-verify quality** against all checkpoints
5) **Only save when quality standards met**

### Common Quality Issues to Auto-Fix:
- **Dialogue too generic**: Add character-specific speech patterns from world_and_characters.md
- **Scenes lack atmosphere**: Add [SETTING] and [WORLDBUILDING] details
- **Script-like exchanges**: Add action beats, internal thoughts, environmental interactions
- **[PROTAGONIST] voice inconsistency**: Apply correct [key characteristic] patterns
- **Missing [GENRE-SPECIFIC elements]**: Integrate natural [genre techniques]
- **Weak [GENRE]**: Add [genre-specific quality markers] elements

---

## FINAL VERIFICATION CHECKLIST

Before submitting completed chapter:
- [ ] Continuity maintained from previous chapter
- [ ] Master outline followed accurately
- [ ] All character voices distinct and match documented patterns
- [ ] [PROTAGONIST]'s [key characteristic] consistently applied throughout
- [ ] Environmental/atmospheric details present in every scene
- [ ] [GENRE] style elements integrated naturally
- [ ] [POV] maximized with [narrative technique]
- [ ] [GENRE-SPECIFIC elements] balanced appropriately
- [ ] [SETTING/WORLDBUILDING] culture accurately represented
- [ ] [SPECIFIC WORLDBUILDING elements] included
- [ ] Chapter saved to Chapters/Chapter_NN_Title.md
- [ ] Quality completion report provided

---

## SUCCESS INDICATORS

A successfully completed chapter will:
- **Sound authentically like [PROTAGONIST]** narrating through [POV/TENSE]
- **Feel atmospheric and immersive** through [SETTING] details
- **Showcase distinct character voices** that match established speech patterns
- **Demonstrate [GENRE] quality** through [genre-specific techniques]
- **Advance plot organically** while maintaining [GENRE-SPECIFIC elements]
- **Require no additional quality revision** after initial completion

---

**Note**: This enhanced workflow eliminates the need for separate CheckStyle runs by integrating quality requirements directly into the writing process. Quality is built in, not added afterward.
