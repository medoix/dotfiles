-- Telescope Mappings
local telescope_mappings = {
    {'n', '<leader>fe', "<cmd>lua require('telescope.builtin').file_browser{ cwd = vim.fn.expand(%:p:h)}<cr>"},
    {'n', '<leader>fg', "<cmd>lua require('telescope.builtin').git_files{}<cr>"},
    {'n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files{ hidden = true }<cr>"},
    {'n', '<leader>fs', "<cmd>lua require('telescope.builtin').live_grep()<cr>"},
    {'n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>"},
    {'n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>"},
}
require'ezmap'.map(telescope_mappings, {'noremap', 'silent'})
