local wezterm = require 'wezterm'
local launch_menu = {}
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    table.insert(
        launch_menu,
        {
            label = "PowerShell",
            args = { "powershell.exe", "-NoLogo" }
        }
    )

    table.insert(
        launch_menu,
        {
            label = "Bash",
            args = { "bash.exe" }
        }
    )

    table.insert(
        launch_menu,
        {
            label = "CMD",
            args = { "cmd.exe" }
        }
    )
    table.insert(
        launch_menu,
        {
            label = "pwsh",
            args = { "pwsh.exe" }
        }
    )
end

return {
    -- Appearance
    window_padding               = {
        left = '0.3cell', -- cell means the line_height
        right = '0cell',
        top = '0.0cell',
        bottom = '0.0cell',
    },
    hide_tab_bar_if_only_one_tab = true,
    enable_tab_bar               = false,

    -- launch_menu
    default_prog              = { "zsh" },
    launch_menu               = launch_menu,
    -- font
    -- font = wezterm.font_with_fallback { 'MesloLGL Nerd Font Mono', 'DengXian', },
    -- font = wezterm.font_with_fallback { 'MesloLGL Nerd Font Mono', },
    font                      = wezterm.font_with_fallback { 'JetbrainsMono Nerd Font Mono', 'DengXian', },
    line_height               = 1.11,
    font_size                 = 17,
    -- font                      = wezterm.font_with_fallback { 'Comic Mono', {family="Symbols Nerd Font Mono",scale=0.6},},
    -- font_size                 = 19.0,
    -- line_height               = 1.3,
    -- color_scheme
    color_scheme              = 'Catppuccin Macchiato',
    window_background_opacity = 0.82,
    -- key_mapps
    keys                      = {
        { key = 'z', mods = 'ALT', action = wezterm.action.ShowLauncher },
        {
            key = 'F11',
            -- mods = 'SHIFT|CTRL',
            action = wezterm.action.ToggleFullScreen,
        },
        {
            key = 'Enter',
            mods = 'ALT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        --    {
        --         key=' ',
        --         mods='CTRL',
        --         -- action=wezterm.action.DisableDefaultAssignment,
        --         action="QuickSelect",
        --     }
    },
    debug_key_events          = true,
}
