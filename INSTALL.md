# Installation protocol

Step-by-step setup for a fresh machine. Run commands in order.

## Windows (native, no admin)

Target: wezterm + PowerShell 7, zsh-feel via PSReadLine + starship + zoxide + PSFzf.

### 1. Install scoop (user-scope, no admin)

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod get.scoop.sh | Invoke-Expression
```

### 2. Add buckets

```powershell
scoop bucket add extras
scoop bucket add nerd-fonts
```

### 3. Install apps and CLI tools

```powershell
scoop install git pwsh wezterm neovim starship zoxide fzf
scoop install JetBrainsMono-NF
```

### 4. Install PowerShell modules (zsh-feel)

```powershell
pwsh -NoProfile -c "Install-Module PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck"
pwsh -NoProfile -c "Install-Module PSFzf      -Scope CurrentUser -Force"
```

### 5. Clone the repo and apply configs

```powershell
git clone <remote> $HOME\dotfiles
pwsh $HOME\dotfiles\bootstrap.ps1
```

Preview without writing:

```powershell
pwsh $HOME\dotfiles\bootstrap.ps1 -DryRun
```

### 6. Restart wezterm

Open wezterm. PowerShell 7 should launch with starship prompt, zoxide (`z <dir>`),
and fzf bindings (`Ctrl+R` history, `Ctrl+T` files).

### Re-applying after edits

Configs are **copied**, not symlinked (no admin / no Dev Mode). After changing a
file in the repo, re-run `pwsh $HOME\dotfiles\bootstrap.ps1`.

### Paths reference

| Module     | Destination                                                              |
|------------|--------------------------------------------------------------------------|
| nvim       | `%LOCALAPPDATA%\nvim`                                                    |
| starship   | `%USERPROFILE%\.config\starship.toml`                                    |
| git ignore | `%USERPROFILE%\.config\git\ignore`                                       |
| zed        | `%APPDATA%\Zed`                                                          |
| opencode   | `%USERPROFILE%\.config\opencode`                                         |
| wezterm    | `%USERPROFILE%\.wezterm.lua`                                             |
| pwsh       | `%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`    |

## macOS

```bash
git clone <remote> ~/dotfiles
bash ~/dotfiles/bootstrap.sh --dry-run   # preview
bash ~/dotfiles/bootstrap.sh             # apply
```

Bootstrap symlinks each `modules/<tool>/` into its `~/.config/...` location.
Edits in the repo apply live.
