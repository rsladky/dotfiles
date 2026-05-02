# Bootstrap dotfiles (Windows, native, no admin)
# Copies configs from this repo into their Windows-native locations.
# Re-run after editing files in the repo (no symlinks: edits don't propagate live).

[CmdletBinding()]
param([switch]$DryRun)

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent (Split-Path -Parent $PSCommandPath)

function Copy-Config {
    param([string]$Src, [string]$Dst)
    $full = Join-Path $repo $Src
    if ($DryRun) {
        Write-Host "  would copy: $full  ->  $Dst"
        return
    }
    $parent = Split-Path -Parent $Dst
    if ($parent) { New-Item -ItemType Directory -Force -Path $parent | Out-Null }
    if (Test-Path $full -PathType Container) {
        New-Item -ItemType Directory -Force -Path $Dst | Out-Null
        Copy-Item -Recurse -Force "$full\*" $Dst
    } else {
        Copy-Item -Force $full $Dst
    }
    Write-Host "  copied: $Dst"
}

Write-Host "Bootstrap dotfiles (Windows) — repo=$repo"

# ── cross-platform ──────────────────────────────────────────────────────────
Copy-Config 'modules\nvim'                    "$env:LOCALAPPDATA\nvim"
Copy-Config 'modules\starship\starship.toml'  "$env:USERPROFILE\.config\starship.toml"
Copy-Config 'modules\git\ignore'              "$env:USERPROFILE\.config\git\ignore"
Copy-Config 'modules\zed'                     "$env:APPDATA\Zed"
Copy-Config 'modules\opencode'                "$env:USERPROFILE\.config\opencode"

# ── windows-native ──────────────────────────────────────────────────────────
Copy-Config 'modules\wezterm\wezterm.lua'     "$env:USERPROFILE\.wezterm.lua"
Copy-Config 'modules\powershell\Microsoft.PowerShell_profile.ps1' `
            "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

Write-Host "Done."
