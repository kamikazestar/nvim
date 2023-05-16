local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then return end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then return end

local trouble = require("trouble.providers.telescope")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
        -- TODO: Keybinding seems to be not working as expected. 
        ["<C-t>"] = trouble.open_with_trouble,
      },
      n = {
        -- TODO: Keybinding seems to be not working as expected. 
        ["<C-t>"] = trouble.open_with_trouble,
      },
    },
  },
})

telescope.load_extension("fzf")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fx', builtin.treesitter, {})
