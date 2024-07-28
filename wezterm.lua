local wezterm = require "wezterm"
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window {}
  window:gui_window():maximize()
end)

local config = {
  default_prog = { "/bin/zsh", "-l" },
  quit_when_all_windows_are_closed = true,

  term = "xterm-256color",
  animation_fps = 60,
  max_fps = 120,
  front_end = "WebGpu",
  webgpu_power_preference = "HighPerformance",

  color_scheme = "Catppuccin Mocha",
  font_size = 15,
  line_height = 1.0,
  -- font = wezterm.font("CaskaydiaCove Nerd Font Mono", { weight = "Regular" }),
  font = wezterm.font_with_fallback {
    "CaskaydiaCove Nerd Font Mono",
    -- "Sarasa Mono J",
    -- "等距更纱黑体 SC",
    -- "终端更纱黑体-简 Nerd",
    "更纱黑体 UI TC",
  },
  font_rules = {
    {
      italic = true,
      font = wezterm.font("CaskaydiaCove Nerd Font Mono", { weight = "Bold", italic = true }),
    },
  },
  harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
  native_macos_fullscreen_mode = true,
  keys = {
    { key = "F4", action = "ToggleFullScreen" },
    { key = "+", mods = "CTRL", action = "IncreaseFontSize" },
    { key = "-", mods = "CTRL", action = "DecreaseFontSize" },
    { key = "Backspace", mods = "CTRL", action = "ResetFontSize" },
    { key = "'", mods = "CTRL", action = wezterm.action.SendString "\x1b[27;5;39~" },
    { key = "(", mods = "CTRL", action = wezterm.action.SendString "\x1b[27;5;40~" },
    { key = ")", mods = "CTRL", action = wezterm.action.SendString "\x1b[27;5;41~" },
    -- { key = ",",         mods = "CTRL",              action = wezterm.action.SendString "\x1b[27;5;44~" },
    -- { key = ".",         mods = "CTRL",              action = wezterm.action.SendString "\x1b[27;5;46~" },
    { key = ";", mods = "CTRL", action = wezterm.action.SendString "\x1b[27;5;59~" },
    { key = "/", mods = "CTRL", action = wezterm.action.SendString "\x1b[27;5;47~" },
    { key = "~", mods = "CTRL", action = wezterm.action.SendString "\x1b[27;5;126~" },
    { key = "`", mods = "CTRL", action = wezterm.action.SendString "\x1b[27;5;96~" },
    { key = "C", mods = "CMD", action = wezterm.action { CopyTo = "Clipboard" } },
    { key = "V", mods = "CMD", action = wezterm.action { PasteFrom = "Clipboard" } },
    {
      key = "Enter",
      mods = "SHIFT",
      action = wezterm.action.SendString "\x1b[13;2u",
    },
  },
  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = false,

  enable_tab_bar = true,
  enable_scroll_bar = false,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = "RESIZE",
  show_new_tab_button_in_tab_bar = false,
  window_background_opacity = 0.75,
  macos_window_background_blur = 20,
  window_close_confirmation = "NeverPrompt",

  text_background_opacity = 0.9,

  adjust_window_size_when_changing_font_size = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  -- initial_rows = 40;
  -- initial_cols = 120;
  hyperlink_rules = wezterm.default_hyperlink_rules(),
}

-- require("mousebinds").apply_to_config(config)

return config
