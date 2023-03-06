local status, db = pcall(require, "dashboard")
if not status then
    vim.notify("没有找到 dashboard")
    return
end


db.setup({
    theme = 'hyper',      --  theme is doom and hyper default is hyper
    disable_move = false, --  defualt is false disable move keymap for hyper
    -- shortcut_type = 'number',  --  shorcut type 'letter' or 'number'
    -- change_to_vcs_root =false, -- default is false,for open file in hyper mru. it will change to the root of vcs
    -- hide = {
    --   statusline = true,    -- hide statusline default is true
    --   tabline = true,      -- hide the tabline
    --   winbar = true       -- hide winbar
    -- },
    -- preview = {
    --   command = true,       -- preview command
    --   file_path  = true,   -- preview file path
    --   file_height = true,   -- preview file height
    --   file_width = true   -- preview file width
    -- },
    config = {
        -- header = {
        --   [[]],
        --   [[███████╗██╗  ██╗██╗   ██╗███╗   ██╗███████╗████████╗]],
        --   [[██╔════╝██║ ██╔╝╚██╗ ██╔╝████╗  ██║██╔════╝╚══██╔══╝]],
        --   [[███████╗█████╔╝  ╚████╔╝ ██╔██╗ ██║█████╗     ██║   ]],
        --   [[╚════██║██╔═██╗   ╚██╔╝  ██║╚██╗██║██╔══╝     ██║   ]],
        --   [[███████║██║  ██╗   ██║   ██║ ╚████║███████╗   ██║   ]],
        --   [[╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═══╝╚══════╝   ╚═╝   ]],
        --   [[]],
        --   [[]],
        --   [[]],
        -- },
        week_header = {
            enable = true,
        },
        -- project = { enable = true, limit = 8, icon='', label = '', action = 'Telescope projects', key = 'p' },
        -- mru = { limit = 9, icon = '', label = '', },
        shortcut = {
            {
                icon = "",
                icon_hl = '@variable',
                desc = "Projects ",
                action = "Telescope projects",
                key = 'p',
            },
            {
                icon = "",
                icon_hl = '@variable',
                desc = "Edit keybindings ",
                action = "edit ~/.config/nvim/lua/keybindings.lua",
                key = 'k',
            },
            {
                icon = "",
                icon_hl = '@variable',
                desc = "Edit Projects ",
                action = "edit ~/.local/share/nvim/project_nvim/project_history",
                key = 'h',
            },
            {
                icon = "",
                icon_hl = '@variable',
                desc = "Edit .zshrc ",
                action = "edit ~/.zshrc",
                key = 'z',
            },
            -- { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
            -- {
            --   icon = ' ',
            --   icon_hl = '@variable',
            --   desc = 'Files',
            --   group = 'Label',
            --   action = 'Telescope find_files',
            --   key = 'f',
            -- },
            -- {
            --   desc = ' Apps',
            --   group = 'DiagnosticHint',
            --   action = 'Telescope app',
            --   key = 'a',
            -- },
            -- {
            --   desc = ' dotfiles',
            --   group = 'Number',
            --   action = 'Telescope dotfiles',
            --   key = 'd',
            -- },
        },
    }, --  config used for theme
})
