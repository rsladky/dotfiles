# Add yazi to dotfiles (macOS)

## Task

Add [yazi](https://yazi-rs.github.io) — a terminal file manager — as a managed module in the dotfiles repo, with a minimal config scaffold and a shell wrapper (`y`) that cd's the parent shell to yazi's exit directory.

## Context

The dotfiles repo follows a `modules/<tool>/` convention, symlinked into `~/.config/<tool>` by `os/macos/bootstrap.sh`. Yazi is not currently installed (`which yazi` → not found) and has no module. The user wants to start using yazi as a file manager. Without the shell wrapper, exiting yazi leaves the parent shell in its original directory — defeating the main UX win — so the wrapper is part of the same change.

Scope: **macOS only**. No Windows wiring (the user does not run yazi on the Windows box). Theme/keymap stay at yazi's defaults; we only create empty scaffold files so future overrides have an obvious home.

## Files to modify

- **NEW** `modules/yazi/yazi.toml` — empty scaffold (header comment only)
- **NEW** `modules/yazi/keymap.toml` — empty scaffold
- **NEW** `modules/yazi/theme.toml` — empty scaffold
- **NEW** `modules/fish/conf.d/50_yazi.fish` — defines `y` function for fish
- **EDIT** `os/macos/bootstrap.sh` — add one `link` line for the yazi module
- **EDIT** `modules/zsh/zshrc` — append `y` shell function near the other CLI tool inits (alongside the eza/bat/lazygit block or after the zoxide/fzf evals)

No changes to `os/windows/bootstrap.ps1` or `INSTALL.md`.

## Steps

1. **Create `modules/yazi/`** with three empty scaffold files. Each starts with a single-line comment pointing at yazi's docs URL so it's obvious where to look when adding overrides. Yazi tolerates missing/empty config files and falls back to bundled defaults — no other content needed.

2. **Wire the symlink** in `os/macos/bootstrap.sh`. Insert after the existing `htop` link (the last "common" block entry), keeping the existing column alignment:
   ```bash
   link "$REPO/modules/yazi"                     "$HOME/.config/yazi"
   ```

3. **Add the zsh wrapper** to `modules/zsh/zshrc`. Place it just after the `alias lg="lazygit"` block (with the other modern-CLI replacements) so it lives near sibling tools rather than buried in env-var territory:
   ```sh
   # yazi: `y` cd's the shell to the dir yazi was in on exit
   function y() {
       local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
       yazi "$@" --cwd-file="$tmp"
       if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
           builtin cd -- "$cwd"
       fi
       rm -f -- "$tmp"
   }
   ```

4. **Add the fish wrapper** at `modules/fish/conf.d/50_yazi.fish` (numeric prefix matches the existing `00_` / `99_` ordering convention in that dir):
   ```fish
   function y
       set tmp (mktemp -t "yazi-cwd.XXXXXX")
       yazi $argv --cwd-file="$tmp"
       if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
           builtin cd -- "$cwd"
       end
       rm -f -- "$tmp"
   end
   ```

5. **Install yazi** (one-time, not part of the dotfiles change itself):
   ```bash
   brew install yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide imagemagick font-symbols-only-nerd-font
   ```
   Most of these (fd, ripgrep, fzf, zoxide) are already present from the existing setup; the rest are yazi's recommended file-preview deps.

## Conventions followed

- **Module layout**: matches existing `modules/<tool>/<files>` pattern (e.g., `modules/aerospace/aerospace.toml`).
- **Symlink-only on macOS**: matches `bootstrap.sh` style — one `link "$REPO/..." "$HOME/..."` line, no copy.
- **Shell wrappers live in their respective shell module**, not in `modules/yazi/` — keeps yazi's directory pure config and matches the precedent that fzf/zoxide inits live in `zshrc`.
- **No comments inside the scaffold tomls** beyond a doc-pointer line, per the "no narration" comment rule.

## Verification

1. **Bootstrap dry-run**, confirm the new yazi link appears and nothing else changes:
   ```bash
   bash ~/dotfiles/bootstrap.sh --dry-run | grep yazi
   ```
2. **Apply** and confirm the symlink:
   ```bash
   bash ~/dotfiles/bootstrap.sh
   ls -l ~/.config/yazi   # should point at ~/dotfiles/modules/yazi
   ```
3. **Smoke-test yazi loads the config** without errors:
   ```bash
   yazi --help >/dev/null    # exits 0 if config parses
   ```
4. **Smoke-test the `y` wrapper** in a fresh zsh and fish shell:
   - Run `y`, navigate to a different directory inside yazi, press `q`.
   - Confirm the shell's `pwd` changed to that directory.
   - Repeat in fish (`fish -c 'y'` won't work — interactive shell required).
5. **Confirm no regressions** in the existing fish/zsh startup: open a fresh shell of each and verify prompt, aliases, and zoxide/fzf bindings still work (no errors on init).
