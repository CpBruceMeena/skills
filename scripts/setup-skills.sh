#!/bin/bash
# setup-skills.sh — Install all skills as Codebuff slash commands
#
# Discovers every SKILL.md in the cabinet/ hierarchy, reads its `name:` from
# frontmatter, and symlinks it into a target directory so Codebuff loads them
# as /skill:<name> commands.
#
# Usage:
#   # Global install (available in all projects)
#   ./scripts/setup-skills.sh
#
#   # Per-project install (isolated to one project)
#   ./scripts/setup-skills.sh --target /path/to/my-project/.agents/skills
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
        -t|--target)
            if [ -z "${2:-}" ]; then
                echo "Error: --target requires a directory path"
                exit 1
            fi
            TARGET_DIR="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: $0 [options]"
            echo ""
            echo "Installs skills from $SKILLS_DIR into a target directory"
            echo "as symlinks, making them available as Codebuff slash commands."
            echo ""
            echo "Options:"  
            echo "  -t, --target DIR   Install into DIR/.agents/skills/ instead of ~/.agents/skills/"
            echo "                     (appends .agents/skills/ automatically)"
            echo "  -v, --verbose      Show full paths for each skill"
            echo "  -h, --help         Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0                                  Global install (~/.agents/skills/)"
            echo "  $0 --target /path/to/my-project     Per-project install"
            echo "  $0 --target .                       Install in current directory's .agents/skills/"
            exit 0
            ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
done

# If --target was a project directory, append .agents/skills/ automatically.
# Skip appending if the path already ends with .agents/skills (in case the
# user passed the full path).
if [ "$TARGET_DIR" != "$HOME/.agents/skills" ]; then
    case "$TARGET_DIR" in
        *.agents/skills) ;;  # already fully specified
        *) TARGET_DIR="${TARGET_DIR%/}/.agents/skills" ;;
    esac
fi

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
echo "✨ Done! $count skills installed to $TARGET_DIR"
echo "   Restart Codebuff to load them as slash commands."
echo ""
echo "💡 Run '/skill:' in Codebuff to see all available commands."
echo "   Or load a specific skill with '/skill:<name>' (e.g., '/skill:ceo-review')."
