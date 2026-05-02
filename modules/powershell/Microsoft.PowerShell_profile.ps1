# PowerShell 7 profile — zsh-flavored

# ── PSReadLine ──────────────────────────────────────────────────────────────
if (Get-Module -ListAvailable PSReadLine) {
    Import-Module PSReadLine
    Set-PSReadLineOption -EditMode Emacs
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin
    Set-PSReadLineOption -PredictionViewStyle ListView
    Set-PSReadLineOption -HistorySearchCursorMovesToEnd
    Set-PSReadLineKeyHandler -Key Tab          -Function MenuComplete
    Set-PSReadLineKeyHandler -Key UpArrow      -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow    -Function HistorySearchForward
}

# ── starship prompt ─────────────────────────────────────────────────────────
if (Get-Command starship -ErrorAction SilentlyContinue) {
    $env:STARSHIP_CONFIG = "$env:USERPROFILE\.config\starship.toml"
    Invoke-Expression (& starship init powershell)
}

# ── zoxide (smart cd) ───────────────────────────────────────────────────────
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Invoke-Expression (& { (zoxide init powershell | Out-String) })
}

# ── PSFzf (Ctrl+R history, Ctrl+T file) ─────────────────────────────────────
if ((Get-Module -ListAvailable PSFzf) -and (Get-Command fzf -ErrorAction SilentlyContinue)) {
    Import-Module PSFzf
    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
}

# ── aliases ─────────────────────────────────────────────────────────────────
Set-Alias -Name vim -Value nvim -ErrorAction SilentlyContinue
Set-Alias -Name vi  -Value nvim -ErrorAction SilentlyContinue
Set-Alias -Name g   -Value git
function ll { Get-ChildItem -Force @args }
function la { Get-ChildItem -Force @args }
function .. { Set-Location .. }
function ... { Set-Location ..\.. }
