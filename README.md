# dotfiles

Config portable — macOS et Windows natif.

## Structure

```
modules/<outil>/   — config de chaque outil
os/macos/          — bootstrap Mac (symlinks)
os/windows/        — bootstrap Windows natif (Copy-Item, pas de symlinks)
```

## Installation

Voir [`INSTALL.md`](./INSTALL.md) pour le protocole pas-à-pas (Windows + macOS).

## Bootstrap (rappel rapide)

```bash
# macOS
bash ~/dotfiles/bootstrap.sh --dry-run   # preview
bash ~/dotfiles/bootstrap.sh             # apply
```

```powershell
# Windows
pwsh $HOME\dotfiles\bootstrap.ps1 -DryRun
pwsh $HOME\dotfiles\bootstrap.ps1
```

## Ajouter un module

1. Créer `modules/<outil>/` avec les fichiers de config.
2. Ajouter une ligne `link ...` dans `os/macos/bootstrap.sh` et/ou
   `Copy-Config ...` dans `os/windows/bootstrap.ps1`.
3. Commit + push.

## KB_LAYOUT (Neovim)

Exporte `KB_LAYOUT` avant de lancer nvim :

```zsh
export KB_LAYOUT=azerty   # ou qwerty (défaut si absent)
```

```powershell
$env:KB_LAYOUT = 'azerty'
```

Les bindings communs sont dans `modules/nvim/lua/core/keymaps/_common.lua`.
Les bindings layout-spécifiques sont dans `_layout_azerty.lua` / `_layout_qwerty.lua`.

## Swap (migration depuis ~/.config) — macOS uniquement

> À faire manuellement une fois le bootstrap validé en dry-run.

```bash
mv ~/.config ~/.config.bak.$(date +%Y%m%d)
mv ~/dotfiles-new ~/dotfiles
bash ~/dotfiles/bootstrap.sh
# tester nvim, tmux, ghostty, aerospace, zsh, fish…
rm -rf ~/.config.bak.*
```

## Machines

| Machine        | OS      | Bootstrap                  | Modules utilisés                                                                              |
|----------------|---------|----------------------------|-----------------------------------------------------------------------------------------------|
| Mac perso      | macOS   | `os/macos/bootstrap.sh`    | nvim, tmux, zsh, ghostty, aerospace, skhd, raycast, zed, fish, opencode, starship, htop, git |
| PC pro Windows | Windows | `os/windows/bootstrap.ps1` | nvim, git, starship, zed, opencode, wezterm, powershell                                      |
