# dotfiles

Config portable — Mac, WSL Arch, Windows.

## Structure

```
modules/<outil>/   — config de chaque outil
os/macos/          — bootstrap Mac
os/wsl-arch/       — bootstrap WSL Arch
os/windows/        — bootstrap Windows (Copy-Item, pas de symlinks)
```

## Bootstrap

```bash
# Mac ou WSL Arch
git clone <remote> ~/dotfiles
bash ~/dotfiles/bootstrap.sh

# Dry-run (preview des symlinks sans les créer)
bash ~/dotfiles/bootstrap.sh --dry-run
```

## Ajouter un module

1. Créer `modules/<outil>/` avec les fichiers de config.
2. Ajouter une ligne `link ...` dans `os/macos/bootstrap.sh` (et/ou wsl-arch).
3. Commit + push.

## KB_LAYOUT (Neovim)

Exporte `KB_LAYOUT` dans `~/.zshrc` ou `~/.zshenv.local` avant de lancer nvim :

```zsh
export KB_LAYOUT=azerty   # ou qwerty (défaut si absent)
```

Les bindings communs sont dans `modules/nvim/lua/core/keymaps/_common.lua`.  
Les bindings layout-spécifiques sont dans `_layout_azerty.lua` / `_layout_qwerty.lua`.

## Swap (migration depuis ~/.config)

> À faire manuellement une fois le bootstrap validé en dry-run.

```bash
# 1. Sauvegarder l'ancienne config
mv ~/.config ~/.config.bak.$(date +%Y%m%d)

# 2. Renommer le repo
mv ~/dotfiles-new ~/dotfiles

# 3. Appliquer les symlinks
bash ~/dotfiles/bootstrap.sh

# 4. Tester nvim, tmux, ghostty, aerospace, zsh, fish…
# 5. Si OK, après quelques jours :
rm -rf ~/.config.bak.*
```

## Machines

| Machine         | OS             | Bootstrap              | Modules utilisés                                     |
|-----------------|----------------|------------------------|------------------------------------------------------|
| Mac perso       | macOS          | `os/macos/bootstrap.sh`| nvim, tmux, zsh, ghostty, aerospace, skhd, raycast, zed, fish, opencode, starship, htop, git |
| PC pro WSL      | WSL Arch Linux | `os/wsl-arch/bootstrap.sh` | nvim, tmux, zsh, zed, fish, opencode, starship, htop, git |
| PC pro Windows  | Windows        | `os/windows/bootstrap.ps1` | wezterm, glazewm (à configurer)                  |
