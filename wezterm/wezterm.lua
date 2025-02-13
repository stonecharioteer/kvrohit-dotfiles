local wezterm = require("wezterm")

-- Tab colors from the Substrata theme
local colors = {
  fg = "#b5b4c9",
  fg1 = "#f0ecfe",
  bg0 = "#191c25",
  bg1 = "#20222d",
  bg2 = "#272935",
  bg3 = "#2e313d",
  bg4 = "#3c3f4e",
}

local tab_bar_colors = {
  background = colors.bg0,
  active_tab = {
    bg_color = colors.bg3,
    fg_color = colors.fg,
  },
  inactive_tab = {
    bg_color = colors.bg1,
    fg_color = colors.fg,
  },
  inactive_tab_hover = {
    bg_color = colors.bg4,
    fg_color = colors.fg,
  },
  new_tab = {
    bg_color = colors.bg1,
    fg_color = colors.fg,
  },
  new_tab_hover = {
    bg_color = colors.bg4,
    fg_color = colors.fg,
  },
}

return {
  font_size = 16.0,
  font = wezterm.font_with_fallback({
    { family = "MonoLisa", weight = "Medium" },
    "Symbols Nerd Font",
  }),
  -- harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  harfbuzz_features = {"ss02"},
  colors = {
    tab_bar = tab_bar_colors,
  },
  color_scheme = "Substrata",
  exit_behavior = "Close",
  tab_max_width = 24,
  hide_tab_bar_if_only_one_tab = true,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
}
