local glow_mappings = {
  {'n', '<leader>p', '<cmd>Glow<cr>'},
}
require'ezmap'.map(glow_mappings, {'noremap', 'silent'})
