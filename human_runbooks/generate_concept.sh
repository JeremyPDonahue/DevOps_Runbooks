#!/bin/bash

# Usage: ./generate_concept.sh OKD

CONCEPT="$1"

if [ -z "$CONCEPT" ]; then
  echo "Usage: $0 <ConceptName>"
  exit 1
fi

DIR="concepts/$CONCEPT"
mkdir -p "$DIR"

# 01_Scope
cat <<EOF > "$DIR/01_Scope_${CONCEPT}.md"
# $CONCEPT – Scope & Frame

## One-Sentence Summary
...

## Why This Matters
...

## Key Subtopics / Subtasks
- [ ] ...
- [ ] ...
- [ ] ...
EOF

# 02_HandsOn
cat <<EOF > "$DIR/02_HandsOn_${CONCEPT}.md"
# $CONCEPT – Hands-On Log

## Environment
- Local / Cloud / Tools used: ...

## Steps Taken
1. ...
2. ...
3. ...

## Problems Encountered
...

## Commands & Fixes
\`\`\`bash
# command examples
\`\`\`

## Notes
...
EOF

# 03_Explain
cat <<EOF > "$DIR/03_Explain_${CONCEPT}.md"
# $CONCEPT – Explain It Simply

## What it is
...

## Why it's useful
...

## How it works (or differs from related tools)
...

## Common misconceptions
...
EOF

# 04_Playbook
cat <<EOF > "$DIR/04_Playbook_${CONCEPT}.md"
# $CONCEPT – Personal Playbook

## When to Use It
...

## Setup / Execution Checklist
- [ ] ...
- [ ] ...
- [ ] ...

## Usage Tips
...

## Troubleshooting
...
EOF

# 05_Review
cat <<EOF > "$DIR/05_Review_${CONCEPT}.md"
# $CONCEPT – Weekly Reflection

## What stuck
...

## What’s still unclear
...

## What I’d do differently
...

## Related resources / journal notes
- ...
EOF

# mastery_checklist
cat <<EOF > "$DIR/mastery_checklist.md"
# $CONCEPT – Mastery Self-Check

- [ ] I can explain this concept clearly and simply.
- [ ] I’ve used it hands-on in a test or real-world scenario.
- [ ] I could re-implement or troubleshoot it confidently.
- [ ] I’ve written a personal reference or guide.
- [ ] I feel ready to answer questions about it.
EOF

echo "✅ Concept folder and files created at: $DIR"
