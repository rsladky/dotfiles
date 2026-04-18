-- forest.lua — forest green theme

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "forest"
vim.o.background = "dark"

local c = {
	bg = "#000000",
	bg1 = "#0e0e0e",
	bg2 = "#161616",
	bg3 = "#222222",
	bg4 = "#2e2e2e",
	fg = "#ffffff",
	fg2 = "#cccccc",
	fg3 = "#888888",
	fg4 = "#444444",

	coral = "#2a6e29",
	peach = "#8ecf8d",
	light = "#b4d4a8",
	mid = "#c7c7c7",
	dark = "#b1b1b1",
}

local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- ── Editor ─────────────────────────────────────────────────────────────────
hi("Normal", { fg = c.fg, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = c.bg1 })
hi("NormalNC", { fg = c.fg2, bg = c.bg })
hi("FloatBorder", { fg = c.fg4, bg = c.bg1 })
hi("FloatTitle", { fg = c.peach, bg = c.bg1, bold = true })

hi("CursorLine", { bg = c.bg2 })
hi("CursorLineNr", { fg = c.peach, bold = true })
hi("LineNr", { fg = c.fg4 })
hi("SignColumn", { fg = c.fg4, bg = c.bg })
hi("ColorColumn", { bg = c.bg2 })
hi("FoldColumn", { fg = c.fg4, bg = c.bg })
hi("Folded", { fg = c.fg3, bg = c.bg2 })

hi("StatusLine", { fg = c.fg2, bg = c.bg1 })
hi("StatusLineNC", { fg = c.fg4, bg = c.bg1 })
hi("WinBar", { fg = c.fg3, bg = c.bg })
hi("WinBarNC", { fg = c.fg4, bg = c.bg })
hi("TabLine", { fg = c.fg3, bg = c.bg1 })
hi("TabLineFill", { bg = c.bg1 })
hi("TabLineSel", { fg = c.fg, bg = c.bg, bold = true })

hi("Visual", { bg = c.bg3 })
hi("VisualNOS", { bg = c.bg3 })
hi("Search", { fg = c.bg, bg = c.light })
hi("IncSearch", { fg = c.bg, bg = c.coral })
hi("CurSearch", { fg = c.bg, bg = c.coral })
hi("Substitute", { fg = c.bg, bg = c.peach })

hi("MatchParen", { fg = c.light, bold = true, underline = true })
hi("Cursor", { fg = c.bg, bg = c.fg })
hi("CursorIM", { fg = c.bg, bg = c.fg })
hi("TermCursor", { fg = c.bg, bg = c.fg })

hi("Pmenu", { fg = c.fg2, bg = c.bg1 })
hi("PmenuSel", { fg = c.fg, bg = c.bg3, bold = true })
hi("PmenuSbar", { bg = c.bg2 })
hi("PmenuThumb", { bg = c.fg4 })
hi("PmenuKind", { fg = c.mid, bg = c.bg1 })
hi("PmenuKindSel", { fg = c.mid, bg = c.bg3 })
hi("PmenuExtra", { fg = c.fg3, bg = c.bg1 })

hi("WildMenu", { fg = c.fg, bg = c.bg3 })
hi("QuickFixLine", { bg = c.bg2 })
hi("Directory", { fg = c.mid })
hi("Title", { fg = c.peach, bold = true })
hi("Question", { fg = c.light })
hi("MoreMsg", { fg = c.light })
hi("ModeMsg", { fg = c.fg2 })
hi("WarningMsg", { fg = c.peach })
hi("ErrorMsg", { fg = c.coral })

hi("NonText", { fg = c.fg4 })
hi("Whitespace", { fg = c.fg4 })
hi("SpecialKey", { fg = c.fg4 })
hi("Conceal", { fg = c.fg3 })
hi("EndOfBuffer", { fg = c.bg })

hi("SpellBad", { undercurl = true, sp = c.coral })
hi("SpellCap", { undercurl = true, sp = c.mid })
hi("SpellRare", { undercurl = true, sp = c.dark })
hi("SpellLocal", { undercurl = true, sp = c.peach })

hi("VertSplit", { fg = c.fg4 })
hi("WinSeparator", { fg = c.fg4 })

-- ── Syntax ──────────────────────────────────────────────────────────────────
hi("Comment", { fg = c.dark })
hi("Constant", { fg = c.light })
hi("String", { fg = c.peach })
hi("Character", { fg = c.peach })
hi("Number", { fg = c.light })
hi("Boolean", { fg = c.coral })
hi("Float", { fg = c.light })

hi("Identifier", { fg = c.fg })
hi("Function", { fg = c.fg })

hi("Statement", { fg = c.coral })
hi("Conditional", { fg = c.coral })
hi("Repeat", { fg = c.coral })
hi("Label", { fg = c.coral })
hi("Operator", { fg = c.fg2 })
hi("Keyword", { fg = c.coral })
hi("Exception", { fg = c.coral })

hi("PreProc", { fg = c.dark })
hi("Include", { fg = c.dark })
hi("Define", { fg = c.dark })
hi("Macro", { fg = c.dark })
hi("PreCondit", { fg = c.dark })

hi("Type", { fg = c.light })
hi("StorageClass", { fg = c.coral })
hi("Structure", { fg = c.light })
hi("Typedef", { fg = c.light })

hi("Special", { fg = c.dark })
hi("SpecialChar", { fg = c.peach })
hi("Tag", { fg = c.coral })
hi("Delimiter", { fg = c.fg3 })
hi("SpecialComment", { fg = c.dark })
hi("Debug", { fg = c.coral })

hi("Underlined", { underline = true })
hi("Bold", { bold = true })
hi("Italic", { italic = true })
hi("Ignore", { fg = c.fg4 })
hi("Error", { fg = c.coral })
hi("Todo", { fg = c.bg, bg = c.light, bold = true })

-- ── Treesitter ───────────────────────────────────────────────────────────────
hi("@variable", { fg = c.fg })
hi("@variable.builtin", { fg = c.coral })
hi("@variable.parameter", { fg = c.peach })
hi("@variable.member", { fg = c.light })

hi("@constant", { fg = c.light })
hi("@constant.builtin", { fg = c.light, bold = true })
hi("@constant.macro", { fg = c.dark })

hi("@string", { fg = c.peach })
hi("@string.escape", { fg = c.coral })
hi("@string.special", { fg = c.peach })
hi("@string.regexp", { fg = c.light })

hi("@character", { fg = c.peach })
hi("@number", { fg = c.light })
hi("@number.float", { fg = c.light })
hi("@boolean", { fg = c.coral })

hi("@function", { fg = c.fg })
hi("@function.builtin", { fg = c.fg, bold = true })
hi("@function.call", { fg = c.fg })
hi("@function.macro", { fg = c.fg })
hi("@function.method", { fg = c.fg })
hi("@function.method.call", { fg = c.fg })

hi("@constructor", { fg = c.light })
hi("@operator", { fg = c.fg2 })

hi("@keyword", { fg = c.coral })
hi("@keyword.function", { fg = c.coral })
hi("@keyword.operator", { fg = c.coral })
hi("@keyword.import", { fg = c.dark })
hi("@keyword.return", { fg = c.coral })
hi("@keyword.conditional", { fg = c.coral })
hi("@keyword.repeat", { fg = c.coral })
hi("@keyword.exception", { fg = c.coral })
hi("@keyword.modifier", { fg = c.coral })

hi("@type", { fg = c.light })
hi("@type.builtin", { fg = c.light, bold = true })
hi("@type.definition", { fg = c.light })
hi("@type.qualifier", { fg = c.coral })

hi("@attribute", { fg = c.dark })
hi("@property", { fg = c.light })

hi("@comment", { fg = c.dark })
hi("@comment.todo", { fg = c.dark })
hi("@comment.warning", { fg = c.bg, bg = c.peach, bold = true })
hi("@comment.error", { fg = c.bg, bg = c.coral, bold = true })
hi("@comment.note", { fg = c.bg, bg = c.mid, bold = true })

hi("@punctuation.bracket", { fg = c.fg3 })
hi("@punctuation.delimiter", { fg = c.fg3 })
hi("@punctuation.special", { fg = c.dark })

hi("@namespace", { fg = c.mid })
hi("@module", { fg = c.mid })
hi("@label", { fg = c.coral })
hi("@tag", { fg = c.coral })
hi("@tag.attribute", { fg = c.peach })
hi("@tag.delimiter", { fg = c.fg3 })

-- ── LSP ─────────────────────────────────────────────────────────────────────
hi("LspReferenceText", { bg = c.bg3 })
hi("LspReferenceRead", { bg = c.bg3 })
hi("LspReferenceWrite", { bg = c.bg3, underline = true })
hi("LspSignatureActiveParameter", { fg = c.light, bold = true })
hi("LspInlayHint", { fg = c.fg4, bg = c.bg1 })
hi("LspCodeLens", { fg = c.fg4 })

hi("DiagnosticError", { fg = c.coral })
hi("DiagnosticWarn", { fg = c.peach })
hi("DiagnosticInfo", { fg = c.mid })
hi("DiagnosticHint", { fg = c.light })
hi("DiagnosticOk", { fg = c.light })

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.coral })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.peach })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.mid })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.light })

hi("DiagnosticSignError", { fg = c.coral })
hi("DiagnosticSignWarn", { fg = c.peach })
hi("DiagnosticSignInfo", { fg = c.mid })
hi("DiagnosticSignHint", { fg = c.light })

hi("DiagnosticVirtualTextError", { fg = c.coral, bg = c.bg1 })
hi("DiagnosticVirtualTextWarn", { fg = c.peach, bg = c.bg1 })
hi("DiagnosticVirtualTextInfo", { fg = c.mid, bg = c.bg1 })
hi("DiagnosticVirtualTextHint", { fg = c.light, bg = c.bg1 })

-- ── Gitsigns ────────────────────────────────────────────────────────────────
hi("GitSignsAdd", { fg = c.light })
hi("GitSignsChange", { fg = c.peach })
hi("GitSignsDelete", { fg = c.coral })
hi("GitSignsAddNr", { fg = c.light })
hi("GitSignsChangeNr", { fg = c.peach })
hi("GitSignsDeleteNr", { fg = c.coral })

-- ── Diff ────────────────────────────────────────────────────────────────────
hi("DiffAdd", { fg = c.light, bg = "#021202" })
hi("DiffChange", { fg = c.peach, bg = "#061a05" })
hi("DiffDelete", { fg = c.coral, bg = "#0a1a08" })
hi("DiffText", { fg = c.light, bg = "#143513" })

-- ── Telescope / Snacks picker ────────────────────────────────────────────────
hi("TelescopeNormal", { fg = c.fg, bg = c.bg1 })
hi("TelescopeBorder", { fg = c.fg4, bg = c.bg1 })
hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg2 })
hi("TelescopePromptBorder", { fg = c.fg4, bg = c.bg2 })
hi("TelescopePromptTitle", { fg = c.bg, bg = c.coral, bold = true })
hi("TelescopePreviewTitle", { fg = c.bg, bg = c.light, bold = true })
hi("TelescopeResultsTitle", { fg = c.bg, bg = c.mid, bold = true })
hi("TelescopeSelection", { bg = c.bg3 })
hi("TelescopeMatching", { fg = c.light, bold = true })

-- ── Snacks ───────────────────────────────────────────────────────────────────
hi("SnacksPickerTitle", { fg = c.bg, bg = c.coral, bold = true })
hi("SnacksPickerBorder", { fg = c.fg4 })
hi("SnacksPickerMatch", { fg = c.light, bold = true })
hi("SnacksDashboardTitle", { fg = c.coral, bold = true })
hi("SnacksDashboardHeader", { fg = c.coral })
hi("SnacksDashboardFooter", { fg = c.fg4 })
hi("SnacksDashboardKey", { fg = c.light })
hi("SnacksDashboardDesc", { fg = c.fg2 })
hi("SnacksDashboardIcon", { fg = c.mid })
hi("SnacksIndent", { fg = c.bg3 })
hi("SnacksIndentScope", { fg = c.fg4 })

-- ── nvim-cmp ─────────────────────────────────────────────────────────────────
hi("CmpItemAbbr", { fg = c.fg2 })
hi("CmpItemAbbrMatch", { fg = c.light, bold = true })
hi("CmpItemAbbrMatchFuzzy", { fg = c.light })
hi("CmpItemAbbrDeprecated", { fg = c.fg4, strikethrough = true })
hi("CmpItemMenu", { fg = c.fg3 })
hi("CmpItemKindFunction", { fg = c.light })
hi("CmpItemKindMethod", { fg = c.light })
hi("CmpItemKindConstructor", { fg = c.light })
hi("CmpItemKindClass", { fg = c.light })
hi("CmpItemKindInterface", { fg = c.light })
hi("CmpItemKindStruct", { fg = c.light })
hi("CmpItemKindVariable", { fg = c.fg })
hi("CmpItemKindField", { fg = c.light })
hi("CmpItemKindProperty", { fg = c.light })
hi("CmpItemKindKeyword", { fg = c.coral })
hi("CmpItemKindText", { fg = c.fg2 })
hi("CmpItemKindSnippet", { fg = c.peach })
hi("CmpItemKindModule", { fg = c.mid })
hi("CmpItemKindEnum", { fg = c.light })
hi("CmpItemKindEnumMember", { fg = c.light })
hi("CmpItemKindConstant", { fg = c.light })
hi("CmpItemKindUnit", { fg = c.light })
hi("CmpItemKindValue", { fg = c.peach })
hi("CmpItemKindEvent", { fg = c.dark })
hi("CmpItemKindOperator", { fg = c.fg2 })
hi("CmpItemKindTypeParameter", { fg = c.light })
hi("CmpItemKindColor", { fg = c.peach })
hi("CmpItemKindFile", { fg = c.fg2 })
hi("CmpItemKindReference", { fg = c.light })
hi("CmpItemKindFolder", { fg = c.light })

-- ── Markdown ──────────────────────────────────────────────────────────────────
hi("@markup.heading.1.markdown", { fg = c.coral, bold = true })
hi("@markup.heading.2.markdown", { fg = c.peach, bold = true })
hi("@markup.heading.3.markdown", { fg = c.light, bold = true })
hi("@markup.heading.4.markdown", { fg = c.mid, bold = true })
hi("@markup.heading.5.markdown", { fg = c.dark, bold = true })
hi("@markup.heading.6.markdown", { fg = c.fg3, bold = true })
hi("@markup.link", { fg = c.mid, underline = true })
hi("@markup.link.url", { fg = c.mid, underline = true })
hi("@markup.link.label", { fg = c.peach })
hi("@markup.raw.block", { bg = c.bg1 })
hi("@markup.raw", { fg = c.peach })
hi("@markup.list", { fg = c.coral })
hi("@markup.list.checked", { fg = c.light })
hi("@markup.list.unchecked", { fg = c.fg3 })
hi("@markup.strong", { bold = true })
hi("@markup.italic", { italic = true })
hi("@markup.strikethrough", { strikethrough = true })

-- ── Mini ────────────────────────────────────────────────────────────────────
hi("MiniStatuslineModeNormal", { fg = c.bg, bg = c.light, bold = true })
hi("MiniStatuslineModeInsert", { fg = c.bg, bg = c.coral, bold = true })
hi("MiniStatuslineModeVisual", { fg = c.bg, bg = c.mid, bold = true })
hi("MiniStatuslineModeReplace", { fg = c.bg, bg = c.peach, bold = true })
hi("MiniStatuslineModeCommand", { fg = c.bg, bg = c.light, bold = true })
hi("MiniStatuslineModeOther", { fg = c.bg, bg = c.dark, bold = true })
hi("MiniStatuslineFilename", { fg = c.fg2, bg = c.bg1 })
hi("MiniStatuslineFileinfo", { fg = c.fg3, bg = c.bg1 })
hi("MiniStatuslineDevinfo", { fg = c.fg3, bg = c.bg1 })
hi("MiniStatuslineInactive", { fg = c.fg4, bg = c.bg1 })
hi("MiniTablineCurrent", { fg = c.fg, bg = c.bg, bold = true })
hi("MiniTablineVisible", { fg = c.fg2, bg = c.bg1 })
hi("MiniTablineHidden", { fg = c.fg4, bg = c.bg1 })
hi("MiniTablineModifiedCurrent", { fg = c.coral, bg = c.bg, bold = true })
hi("MiniTablineModifiedVisible", { fg = c.coral, bg = c.bg1 })
hi("MiniTablineModifiedHidden", { fg = c.coral, bg = c.bg1 })
hi("MiniTablineFill", { bg = c.bg1 })
hi("MiniCursorword", { bg = c.bg3, underline = true })
hi("MiniIndentscopeSymbol", { fg = c.fg4 })
hi("MiniJump", { fg = c.bg, bg = c.light })
hi("MiniJump2dSpot", { fg = c.light, bold = true })
hi("MiniSurround", { fg = c.bg, bg = c.peach })

-- ── Harpoon ──────────────────────────────────────────────────────────────────
hi("HarpoonBorder", { fg = c.fg4 })
hi("HarpoonWindow", { fg = c.fg, bg = c.bg1 })
