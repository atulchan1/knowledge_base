#!/bin/bash

# A helper script to update the commit_ref.log files with the latest commit hashes from the main branches of the tracked repositories.
#
# This script should be run AFTER you have made manual updates to the documentation (flows.md, etc.)
# and BEFORE you commit those changes. The resulting changes from this script should be
# included in your documentation commit.

set -e # Exit immediately if a command exits with a non-zero status.

# 1. Ensure we are in the knowledge_base directory
cd "$(dirname "$0")"

# 2. Define repository paths (relative to this script's location)
TACTICSCHESS_REPO_PATH="../tacticschess"
CHECKMATE_REPO_PATH="../checkmate"

# 3. Get the latest commit hashes from the main branches of the tracked repos
echo "Fetching latest commit hashes from tracked repositories..."
TACTICSCHESS_HASH=$(git -C "$TACTICSCHESS_REPO_PATH" rev-parse main)
CHECKMATE_HASH=$(git -C "$CHECKMATE_REPO_PATH" rev-parse main)

echo "  - tacticschess: $TACTICSCHESS_HASH"
echo "  - checkmate:    $CHECKMATE_HASH"

# 4. Update the commit_ref.log files
echo "Updating commit_ref.log files..."
echo "$TACTICSCHESS_HASH" > tacticschess/commit_ref.log
echo "$CHECKMATE_HASH" > checkmate/commit_ref.log

echo ""
echo "✅ commit_ref.log files have been updated."
echo "You can now 'git add .' and commit these changes along with your other documentation updates."