# dotfiles

Personal config for a tmux-first, vim-centric workflow on macOS.
**Stack:** Ghostty → tmux → Neovim · Theme: Vesper · Keyboard: AZERTY

---

## Ghostty

Ghostty launches directly into a tmux session (`tmux new-session -A -s main`).
Cmd keys are remapped to Meta sequences so tmux receives them without a prefix.

| Key | Action |
|-----|--------|
| `Cmd+a` | tmux prefix (sends `M-a`) |
| `Cmd+d` | vertical split |
| `Cmd+D` | horizontal split |
| `Cmd+t` | new window |
| `Cmd+w` | close pane |
| `Cmd+k` | clear screen + scrollback |

---

## tmux

**Prefix:** `Ctrl+a` or `Cmd+a`

### Windows
| Key | Action |
|-----|--------|
| `Cmd+1–0` | jump to window 1–10 (AZERTY number row) |
| `prefix + h / l` | move current window left / right |
| `prefix + m` | move window to position N |
| `prefix + r` | reload config |

### Panes
| Key | Action |
|-----|--------|
| `Ctrl+h/j/k/l` or `Cmd+h/j/k/l` | navigate panes (vim-tmux-navigator) |
| `prefix + ←→↑↓` | resize pane |
| `prefix + x` | kill pane |
| `prefix + X` | kill window |

### Copy mode
| Key | Action |
|-----|--------|
| `prefix + v` | enter copy mode |
| `v` | begin selection |
| `y` | yank and exit |
| `Ctrl+v` | rectangle selection |
| `Escape` | cancel |

---

## Neovim

**Leader:** `Space`

### Navigation
| Key | Action |
|-----|--------|
| `leader + p` | find files |
| `leader + sg` | live grep |
| `leader + sw` | grep word under cursor |
| `leader + s.` | recent files |
| `leader + space` | open buffers |
| `leader + /` | fuzzy search current buffer |
| `Cmd+p` | find files (Telescope) |

### Harpoon (AZERTY marks)
| Key | Action |
|-----|--------|
| `leader + a` | add file to harpoon |
| `leader + e` | open harpoon menu |
| `leader + &` | jump to mark 1 |
| `leader + é` | jump to mark 2 |
| `leader + "` | jump to mark 3 |
| `leader + '` | jump to mark 4 |

### LSP
| Key | Action |
|-----|--------|
| `gd` | go to definition |
| `gr` | go to references |
| `gI` | go to implementation |
| `leader + D` | type definition |
| `leader + ds` | document symbols |
| `leader + ws` | workspace symbols |
| `[d / ]d` | previous / next diagnostic |
| `leader + d` | open diagnostic float |

### Git
| Key | Action |
|-----|--------|
| `leader + g` | open LazyGit |
| `leader + gb` | open in GitHub |
| `leader + ngs` | git status picker |

### Explorer & Terminal
| Key | Action |
|-----|--------|
| `leader + b` | toggle file explorer |
| `\` | reveal current file in explorer |
| `leader + ft` | floating terminal |

### Editing
| Key | Action |
|-----|--------|
| `jk` / `kj` | exit insert mode |
| `Ctrl+s` | save |
| `Ctrl+q` | quit |
| `leader + q` | close buffer (quit if last) |
| `leader + bd` | delete buffer |
| `Tab / S-Tab` | indent / dedent |
| `ù` | jump to matching bracket (`%`, AZERTY) |
| `Ctrl+d / u` | scroll half-page, centered |

### Toggles
| Key | Action |
|-----|--------|
| `leader + us` | toggle spelling |
| `leader + uw` | toggle line wrap |
| `leader + ud` | toggle diagnostics |
| `leader + uh` | toggle inlay hints |
