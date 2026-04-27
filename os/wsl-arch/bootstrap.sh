#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "$0")/../.." && pwd)"
DRY="${1:-}"

link() {
  local src="$1" dst="$2"
  if [[ "$DRY" == "--dry-run" ]]; then
    echo "ln -sfn $src  ->  $dst"
    return
  fi
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    local bak="$dst.bak.$(date +%s)"
    echo "  backup: $dst -> $bak"
    mv "$dst" "$bak"
  fi
  ln -sfn "$src" "$dst"
  echo "  linked: $dst"
}

echo "Bootstrap dotfiles (WSL Arch) — REPO=$REPO"

link "$REPO/modules/nvim"                   "$HOME/.config/nvim"
link "$REPO/modules/tmux"                   "$HOME/.config/tmux"
link "$REPO/modules/zsh/zshrc"              "$HOME/.zshrc"
link "$REPO/modules/zed"                    "$HOME/.config/zed"
link "$REPO/modules/fish"                   "$HOME/.config/fish"
link "$REPO/modules/opencode"               "$HOME/.config/opencode"
link "$REPO/modules/starship/starship.toml" "$HOME/.config/starship.toml"
link "$REPO/modules/htop"                   "$HOME/.config/htop"
link "$REPO/modules/git/ignore"             "$HOME/.config/git/ignore"

echo "Done."
