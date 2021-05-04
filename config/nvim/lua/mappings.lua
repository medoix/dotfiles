local M = {}

function M.setup() M.mappings() end

function M.mappings()

  -- Movement Mappings
  local movements_mappings = {
    {'n', '<leader>h', '<cmd>wincmd h<cr>'},
    {'n', '<leader>j', '<cmd>wincmd j<cr>'},
    {'n', '<leader>k', '<cmd>wincmd k<cr>'},
    {'n', '<leader>l', '<cmd>wincmd l<cr>'},
  }
  require'ezmap'.map(movements_mappings, {'noremap', 'silent'})

end

return M
