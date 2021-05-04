local hop_mappings = {
  {'n', '<leader>h1', '<cmd>HopChar1<cr>'},
  {'n', '<leader>h2', '<cmd>HopChar2<cr>'},
  {'n', '<leader>hh', '<cmd>HopPattern<cr>'},
  {'n', '<leader>hw', '<cmd>HopWord<cr>'},
}
require'ezmap'.map(hop_mappings, {'noremap', 'silent'})
