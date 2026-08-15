#!/usr/bin/env bash
# Publishes this folder to GitHub Pages as NeoMedia23/neomediainc-site.
# Run once from this folder:  ./deploy.sh
# Re-running is safe: if the repo already exists it just pushes the latest commit.
set -euo pipefail
cd "$(dirname "$0")"

REPO="NeoMedia23/neomediainc-site"

if ! command -v gh >/dev/null 2>&1; then
  echo "gh (GitHub CLI) not found. Install it or deploy via the GitHub website."; exit 1
fi

# Make sure everything is committed.
git add -A
git commit -m "Publish neomediainc.com" >/dev/null 2>&1 || true

if gh repo view "$REPO" >/dev/null 2>&1; then
  echo "Repo exists — pushing latest…"
  git remote get-url origin >/dev/null 2>&1 || git remote add origin "https://github.com/$REPO.git"
  git push -u origin HEAD:main
else
  echo "Creating public repo $REPO and pushing…"
  gh repo create "$REPO" --public --source=. --remote=origin --push
fi

# Turn on GitHub Pages (main branch, root). Ignore error if already enabled.
echo "Enabling GitHub Pages…"
echo '{"source":{"branch":"main","path":"/"}}' | gh api -X POST "repos/$REPO/pages" --input - >/dev/null 2>&1 \
  || echo '{"source":{"branch":"main","path":"/"}}' | gh api -X PUT "repos/$REPO/pages" --input - >/dev/null 2>&1 \
  || echo "  (Pages may already be enabled — check Settings → Pages)"

echo
echo "Published. Next: set Namecheap DNS (see DEPLOY.md Step 2), then enforce HTTPS (Step 3)."
echo "Live URL after DNS propagates: https://neomediainc.com"
