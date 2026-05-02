-- wezterm config — Cendre theme, tmux-equivalent multiplexer
local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- ── shell ───────────────────────────────────────────────────────────────────
config.default_prog = { 'pwsh.exe', '-NoLogo' }

-- ── font ────────────────────────────────────────────────────────────────────
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 12.0

-- ── window ──────────────────────────────────────────────────────────────────
config.window_decorations = 'RESIZE'
config.window_padding = { left = 6, right = 6, top = 6, bottom = 6 }
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 32

-- ── Cendre color scheme (mirrors modules/ghostty/config) ────────────────────
config.color_schemes = {
  ['Cendre'] = {
    background = '#000000',
    foreground = '#ffffff',
    cursor_bg = '#ffffff',
    cursor_fg = '#000000',
    cursor_border = '#ffffff',
    selection_bg = '#222222',
    selection_fg = '#ffffff',
    ansi = {
      '#000000', '#ff5555', '#888888', '#ffc799',
      '#555555', '#c8c8c8', '#888888', '#cccccc',
    },
    brights = {
      '#333333', '#ff5555', '#c8c8c8', '#ffc799',
      '#888888', '#c8c8c8', '#888888', '#ffffff',
    },
    tab_bar = {
      background = '#101010',
      active_tab        = { bg_color = '#ffffff', fg_color = '#000000', intensity = 'Bold' },
      inactive_tab      = { bg_color = '#101010', fg_color = '#ffffff' },
      inactive_tab_hover= { bg_color = '#222222', fg_color = '#ffffff' },
      new_tab           = { bg_color = '#101010', fg_color = '#555555' },
      new_tab_hover     = { bg_color = '#222222', fg_color = '#ffffff' },
    },
  },
}
config.color_scheme = 'Cendre'

-- ── status line right (mirrors tmux: workspace badge + clock) ───────────────
wezterm.on('update-right-status', function(window, _)
  local ws = window:active_workspace()
  local time = wezterm.strftime('%H:%M')
  window:set_right_status(wezterm.format {
    { Background = { Color = '#ff5555' } },
    { Foreground = { Color = '#000000' } },
    { Attribute = { Intensity = 'Bold' } },
    { Text = '  ' .. ws .. '  ' },
    'ResetAttributes',
    { Background = { Color = '#101010' } },
    { Foreground = { Color = '#555555' } },
    { Text = '  ' .. time .. ' ' },
  })
end)

-- ── leader (matches tmux prefix C-a) ────────────────────────────────────────
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1500 }

-- ── vim-aware pane nav (smart-splits.nvim wezterm-side pattern) ─────────────
local function is_vim(pane)
  local p = pane:get_foreground_process_name() or ''
  return p:find('n?vim') ~= nil
end

local directions = {
  h = { vim = 'h', wez = 'Left'  },
  j = { vim = 'j', wez = 'Down'  },
  k = { vim = 'k', wez = 'Up'    },
  l = { vim = 'l', wez = 'Right' },
}

for key, d in pairs(directions) do
  wezterm.on('vim-or-pane-' .. key, function(window, pane)
    if is_vim(pane) then
      window:perform_action(act.SendKey { key = d.vim, mods = 'CTRL' }, pane)
    else
      window:perform_action(act.ActivatePaneDirection(d.wez), pane)
    end
  end)
end

-- ── keybindings ─────────────────────────────────────────────────────────────
config.keys = {
  -- splits / tabs / close / clear (no prefix — mirrors tmux M-d/D/t/w/k)
  { key = 'd', mods = 'ALT',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'D', mods = 'ALT|SHIFT', action = act.SplitVertical   { domain = 'CurrentPaneDomain' } },
  { key = 't', mods = 'ALT',       action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'ALT',       action = act.CloseCurrentPane { confirm = false } },
  { key = 'k', mods = 'ALT',       action = act.Multiple {
      act.ClearScrollback 'ScrollbackAndViewport',
      act.SendKey { key = 'L', mods = 'CTRL' },
  } },

  -- vim-aware pane nav
  { key = 'h', mods = 'CTRL', action = act.EmitEvent 'vim-or-pane-h' },
  { key = 'j', mods = 'CTRL', action = act.EmitEvent 'vim-or-pane-j' },
  { key = 'k', mods = 'CTRL', action = act.EmitEvent 'vim-or-pane-k' },
  { key = 'l', mods = 'CTRL', action = act.EmitEvent 'vim-or-pane-l' },

  -- leader-prefixed (muscle memory from tmux)
  { key = 'd', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'D', mods = 'LEADER|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 't', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'LEADER', action = act.CloseCurrentPane { confirm = false } },
  { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = false } },
  { key = 'r', mods = 'LEADER', action = act.ReloadConfiguration },
  { key = 'v', mods = 'LEADER', action = act.ActivateCopyMode },
  { key = 'f', mods = 'LEADER', action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' } },
  { key = 's', mods = 'LEADER', action = act.SwitchWorkspaceRelative(1) },
  { key = 'a', mods = 'LEADER', action = act.SendKey { key = 'a', mods = 'CTRL' } },

  -- pane resize via leader+arrow (repeat-friendly)
  { key = 'LeftArrow',  mods = 'LEADER', action = act.AdjustPaneSize { 'Left',  5 } },
  { key = 'RightArrow', mods = 'LEADER', action = act.AdjustPaneSize { 'Right', 5 } },
  { key = 'UpArrow',    mods = 'LEADER', action = act.AdjustPaneSize { 'Up',    5 } },
  { key = 'DownArrow',  mods = 'LEADER', action = act.AdjustPaneSize { 'Down',  5 } },
}

-- Alt+1..9,0 → activate tab 0..9
for i = 1, 9 do
  table.insert(config.keys, { key = tostring(i), mods = 'ALT', action = act.ActivateTab(i - 1) })
end
table.insert(config.keys, { key = '0', mods = 'ALT', action = act.ActivateTab(9) })

return config
