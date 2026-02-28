---
description: Create a new Zettelkasten note with guided interview
agent: notetaker
---

You are creating a new atomic note with the filename: **$1.md**

## Step 1: Determine Note Location

First, ask the user which subfolder in $NOTES_PATH the note should be created in. List the available subfolders and let them choose, or allow them to specify a new subfolder path if needed.

## Step 2: Interview the User

Once the location is determined, conduct a thorough interview with the user about the topic "$1". Ask targeted questions to extract their current understanding, insights, and knowledge about this concept. 

Questions should cover:
- What is their current understanding of this concept?
- What are the key ideas or principles they know about it?
- Are there any examples, applications, or practical uses they're aware of?
- How does this concept relate to other things they know?
- What context or background is important to understand this concept?
- Are there any specific details, steps, or components they want to capture?

## Step 3: Create the Atomic Note

Based on the information gathered from the interview:
1. Create a properly structured atomic note following strict Zettelkasten principles
2. Include complete YAML frontmatter with title, date, tags, aliases, and id
3. Write clear, standalone content based ONLY on what the user provided
4. Add relevant wikilinks to existing notes (verify they exist first)
5. Include a Related Notes section with meaningful connections
6. Save the note to the subfolder chosen in Step 1

Remember: Document what the USER knows, not what the internet says. Only research external sources if the user explicitly requests it.
