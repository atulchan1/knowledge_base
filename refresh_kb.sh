#!/bin/bash

# A script to refresh the knowledge base with the latest commit references from tracked repositories.
# This script automates the mechanical parts of the update process.
#
# IMPORTANT: This script does NOT update the descriptive documentation (flows.md, tags.md, etc.).
# This still needs to be done manually after the script is run.

set -e # Exit immediately if a command exits with a non-zero status.

# 1. Ensure we are in the knowledge_base directory
cd "$(dirname "$0")"

# 2. Ensure we are on the main branch and it's clean
echo "Verifying git status..."
if [ -n "$(git status --porcelain)" ]; then
  echo "Error: Working directory is not clean. Please commit or stash your changes."
  exit 1
fi
if [ "$(git rev-parse --abbrev-ref HEAD)" != "main" ]; then
    echo "Error: Not on the main branch. Please switch to main before running."
    exit 1
fi


# 3. Pull the latest changes for the knowledge_base itself
echo "Pulling latest changes for knowledge_base..."
git pull origin main

# 4. Define repository paths (relative to this script's location)
TACTICSCHESS_REPO_PATH="../tacticschess"
CHECKMATE_REPO_PATH="../checkmate"

# 5. Get the latest commit hashes from the main branches of the tracked repos
echo "Fetching latest commit hashes from tracked repositories..."
TACTICSCHESS_HASH=$(git -C "$TACTICSCHESS_REPO_PATH" rev-parse main)
CHECKMATE_HASH=$(git -C "$CHECKMATE_REPO_PATH" rev-parse main)

echo "  - tacticschess: $TACTICSCHESS_HASH"
echo "  - checkmate:    $CHECKMATE_HASH"

# 6. Update the commit_ref.log files
echo "Updating commit_ref.log files..."
echo "$TACTICSCHESS_HASH" > tacticschess/commit_ref.log
echo "$CHECKMATE_HASH" > checkmate/commit_ref.log

# 7. Commit and push the changes
echo "Committing and pushing updated commit refs..."
git add tacticschess/commit_ref.log checkmate/commit_ref.log
git commit -m "chore: Refresh commit refs for tracked repos"
git push origin main

echo ""
echo "✅ Successfully updated and pushed commit references."
echo ""
echo "下一步 (Next Step):"
echo "Please manually update the documentation (flows.md, tags.md, etc.) to reflect the changes in the new commits."
