local floaterm_mappings = {
  {'n', '<leader>ld', '<cmd>FloatermNew lazydocker<cr>'},
  {'n', '<leader>lg', '<cmd>FloatermNew lazygit<cr>'},
  {'n', '<leader>rr', '<cmd>FloatermNew ranger<cr>'},
  {'n', '<leader>tt', '<cmd>FloatermNew<cr>'},
}
require'ezmap'.map(floaterm_mappings, {'noremap', 'silent'})
