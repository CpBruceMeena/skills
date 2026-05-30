#!/bin/bash
# setup-skills.sh — Install all skills as global Codebuff slash commands
#
# This script discovers every SKILL.md in the cabinet/ hierarchy, reads its
# `name:` from frontmatter, and symlinks it into ~/.agents/skills/<name>/SKILL.md
# so Codebuff loads them as /skill:<name> commands.
#
# Usage:
#   cd Skills/
#   ./scripts/setup-skills.sh
#
# Run again after adding, renaming, or updating skills to refresh the symlinks.
# Restart Codebuff after running this script.

set -euo pipefail

SKILLS_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TARGET_DIR="$HOME/.agents/skills"
VERBOSE=false

# Parse flags
while [[ $# -gt 0 ]]; do
    case "$1" in
        -v|--verbose) VERBOSE=true; shift ;;
        -h|--help)
            echo "Usage: $0 [-v|--verbose] [-h|--help]"
            echo ""
            echo "Installs all skills from $SKILLS_DIR into $TARGET_DIR"
            echo "as symlinks, making them available as Codebuff slash commands."
            echo ""
            echo "  -v, --verbose    Show full paths for each skill"
            echo "  -h, --help       Show this help message"
            exit 0
            ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
done

echo "📁 Skills source: $SKILLS_DIR"
echo "🎯 Installing to:  $TARGET_DIR"
echo ""

# Create target directory
mkdir -p "$TARGET_DIR"

# ── Step 1: Clean stale symlinks ──────────────────────────────────────────
# Remove any symlink targets that no longer point to an existing file.
echo "🧹 Cleaning stale symlinks..."
stale_count=0
for existing_link in "$TARGET_DIR"/*/SKILL.md; do
    [ -f "$existing_link" ] || continue  # skip if no files matched
    if [ -L "$existing_link" ] && [ ! -e "$existing_link" ]; then
        dir_to_remove="$(dirname "$existing_link")"
        skill_name="$(basename "$dir_to_remove")"
        echo "   Removing stale: $skill_name"
        rm -rf "$dir_to_remove"
        stale_count=$((stale_count + 1))
    fi
done
[ "$stale_count" -eq 0 ] && echo "   None found"

# ── Step 2: Symlink every SKILL.md found in the cabinet ───────────────────
echo ""
count=0
while IFS= read -r -d '' skill_file; do
    # Read the name from frontmatter (first occurrence of 'name:' after the opening '---')
    name=$(grep -m1 '^name: ' "$skill_file" | sed 's/^name: *//')

    if [ -z "$name" ]; then
        echo "⚠️  Skipping $skill_file — no 'name:' found in frontmatter"
        continue
    fi

    mkdir -p "$TARGET_DIR/$name"
    ln -sf "$skill_file" "$TARGET_DIR/$name/SKILL.md"

    if [ "$VERBOSE" = true ]; then
        echo "✅ $name → $TARGET_DIR/$name/SKILL.md"
    else
        echo "✅ $name"
    fi
    count=$((count + 1))
done < <(find "$SKILLS_DIR" -name 'SKILL.md' -print0)

echo ""
echo "✨ Done! $count skills installed to ~/.agents/skills/"
echo "   Restart Codebuff to load them as slash commands."
echo ""
echo "💡 Run '/skill:' in Codebuff to see all available commands."
echo "   Or load a specific skill with '/skill:<name>' (e.g., '/skill:ceo-review')."
