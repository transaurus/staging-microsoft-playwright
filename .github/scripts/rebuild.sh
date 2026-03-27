#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for microsoft/playwright.dev
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.

# --- Node version ---
export NVM_DIR="${HOME}/.nvm"
if [ -f "${NVM_DIR}/nvm.sh" ]; then
  # shellcheck disable=SC1091
  source "${NVM_DIR}/nvm.sh"
  nvm use 20 2>/dev/null || nvm install 20
fi

echo "Node version: $(node --version)"
echo "npm version: $(npm --version)"

# --- Install dependencies ---
npm install

# --- Pre-build steps ---
# Prepare the nodejs language variant (copies config to root)
npm run prepare-nodejs

# --- Build ---
npm run build

echo "[DONE] Build complete."
