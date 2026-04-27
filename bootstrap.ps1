# Bootstrap dotfiles (Windows) — dispatcher
$repo = Split-Path -Parent $PSScriptRoot
& "$repo\os\windows\bootstrap.ps1" @args
