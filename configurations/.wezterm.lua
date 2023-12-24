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
    use_ime                      = true,
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
    default_prog                 = { "zsh" },
    launch_menu                  = launch_menu,

    -- font
    -- font = wezterm.font_with_fallback { 'MesloLGL Nerd Font Mono', 'DengXian', },
    -- font                         = wezterm.font_with_fallback { 'JetBrainsMono Nerd Font Mono', 'Noto Color Emoji', 'DengXian', },
    font                         = wezterm.font_with_fallback { 'JetBrainsMono Nerd Font Mono', 'Twemoji Mozilla', 'DengXian', },
    --     'DengXian', },
    line_height                  = 1.11,
    font_size                    = 17,

    enable_kitty_graphics        = true,

    -- Color Schemes
    -- color_scheme                 = 'Catppuccin Mocha',
    -- color_scheme                 = 'Oxocarbon Dark',
    color_scheme                 = 'iTerm2 Smoooooth',
    -- color_scheme                 = 'iTerm2 Default',
    -- color_scheme                 = 'iTerm2 Dark Background',
    colors                       = {
        -- background = '#141b1e'
    },
    -- colors                       = {
    --     ansi = {
    --         '#282c34',
    --         '#e06c75',
    --         '#8ccf7e',
    --         '#e5c76b',
    --         '#ef7e7e',
    --         '#67b0e8',
    --         '#6cbfbf',
    --         '#dadada',
    --     },
    --     background = '#141b1e',
    --     brights = {
    --         '#b3b9b8',
    --         '#e9969d',
    --         '#addda3',
    --         '#edd796',
    --         '#f5abab',
    --         '#93c7ef',
    --         '#90cece',
    --         '#f3f3f3',
    --     },
    --
    --     cursor_bg = '#67b0e8',
    --     cursor_fg = '#141b1e',
    --     foreground = '#abb2bf',
    --     selection_bg = '#67b0e8',
    --     selection_fg = '#abb2bf',
    -- },
    -- window_background_opacity    = 0.82,

    -- key_mapps
    keys                         = {
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
    debug_key_events             = true,
}
