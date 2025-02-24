-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local act = wezterm.action
local mux = wezterm.mux

-- Debug
config.automatically_reload_config = true

-- Color theme
config.colors = {
  selection_fg = '#1e1e2e',
  selection_bg = '#f5e0dc',
  cursor_bg = '#f5e0dc',
  cursor_border = '#f5e0dc',

  split = '#444444',

  tab_bar = {
    background = 'black'
  },
}

-- Decorations and tab bar
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(wezterm.format({
    { Text = ' ' .. window:active_workspace() .. ' ' },
  }))
end)

-- Font
config.font = wezterm.font {
  family = 'Monaspace Neon',
  harfbuzz_features = { 'calt', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09', 'liga' }
}
config.freetype_load_target = "Normal"

-- Rendering
config.max_fps = 170
config.front_end = 'OpenGL'
config.webgpu_preferred_adapter = wezterm.gui.enumerate_gpus()[1]

-- Mappings
config.leader = {
  key = 'b',
  mods = 'CTRL',
  timeout_milliseconds = 2000,
}

config.keys = {
  -- Copy/Paste
  { key = 'c',         mods = 'ALT',    action = wezterm.action.CopyTo 'Clipboard' },
  { key = 'v',         mods = 'ALT',    action = wezterm.action.PasteFrom 'Clipboard' },

  -- Font size
  { key = '-',         mods = 'ALT',    action = wezterm.action.DecreaseFontSize },
  { key = '=',         mods = 'ALT',    action = wezterm.action.IncreaseFontSize },
  { key = 'Backspace', mods = 'ALT',    action = wezterm.action.ResetFontSize },

  { key = 'h',         mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
  { key = 'j',         mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
  { key = 'k',         mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
  { key = 'l',         mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
  { key = 'h',         mods = 'ALT',    action = act.ActivatePaneDirection 'Left' },
  { key = 'j',         mods = 'ALT',    action = act.ActivatePaneDirection 'Down' },
  { key = 'k',         mods = 'ALT',    action = act.ActivatePaneDirection 'Up' },
  { key = 'l',         mods = 'ALT',    action = act.ActivatePaneDirection 'Right' },

  { key = 'a',         mods = 'LEADER', action = act.AttachDomain 'default_unix' },
  { key = 'd',         mods = 'LEADER', action = act.DetachDomain 'CurrentPaneDomain' },

  { key = 'w',         mods = 'LEADER', action = act.ShowTabNavigator },
  { key = 'W',         mods = 'LEADER', action = act.ShowLauncherArgs { flags = 'WORKSPACES' } },

  { key = '1',         mods = 'ALT',    action = act.ActivateTab(0) },
  { key = '2',         mods = 'ALT',    action = act.ActivateTab(1) },
  { key = '3',         mods = 'ALT',    action = act.ActivateTab(2) },
  { key = '4',         mods = 'ALT',    action = act.ActivateTab(3) },
  { key = '5',         mods = 'ALT',    action = act.ActivateTab(4) },
  { key = '6',         mods = 'ALT',    action = act.ActivateTab(5) },
  { key = '7',         mods = 'ALT',    action = act.ActivateTab(6) },
  { key = '8',         mods = 'ALT',    action = act.ActivateTab(7) },
  { key = '9',         mods = 'ALT',    action = act.ActivateTab(8) },

  { key = '[',         mods = 'LEADER', action = wezterm.action.ActivateCopyMode },
  { key = 'z',         mods = 'LEADER', action = wezterm.action.TogglePaneZoomState },
  { key = 'Enter',     mods = 'ALT',    action = act.SpawnTab 'CurrentPaneDomain' },


  {
    key = ',',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(
        function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end
      ),
    },
  },
  {
    key = '$',
    mods = 'LEADER|SHIFT',
    action = act.PromptInputLine {
      description = 'Enter new name for session',
      action = wezterm.action_callback(
        function(window, pane, line)
          if line then
            mux.rename_workspace(
              window:mux_window():get_workspace(),
              line
            )
          end
        end
      ),
    },
  },

  {
    key = 'v',
    mods = 'LEADER',
    action = act.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  {
    key = 's',
    mods = 'LEADER',
    action = act.SplitPane {
      direction = 'Down',
      size = { Percent = 50 },
    },
  },
}

-- Configure a default domain and connect it on startup
-- config.unix_domains = {
--   {
--     name = 'default_unix',
--   }
-- }
-- config.default_gui_startup_args = { 'connect', 'default_unix', '--new-tab' }
config.default_prog = { 'zsh' }

return config
