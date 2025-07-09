local telescope = require('telescope')
local builtin = require('telescope.builtin')
local fb_actions = require('telescope._extensions.file_browser.actions')


telescope.setup {
    defaults = {
        preview = {
            treesitter = false
        },
        file_ignore_patterns = {
            '.git/',
            'node_modules/',
            '.clj-kondo/',
        }
    },
    extensions = {
        file_browser = {
            dir_icon = '',
            depth = 0,
            grouped = true,
            hidden = true,
            auto_depth = true,
            hide_parent_dir = true,
            hijack_netrw = true,
            mappings = {
                n = {
                    ['u'] = fb_actions.goto_parent_dir
                }
            }
        },
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = 'smart_case'
        }
    }
}

telescope.load_extension('fzf')

vim.keymap.set('n', '<leader>fb', telescope.extensions.file_browser.file_browser, {})
vim.keymap.set('n', '<leader>fc', builtin.command_history, {})
vim.keymap.set('n', '<leader>ff', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fj', builtin.jumplist, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fp', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.colorscheme, {})

