-- Mappings
local gitmessenger_mappings = {
  {'n', '<leader>gm', '<Plug>(git-messenger)'},
}
require'ezmap'.map(gitmessenger_mappings, {'noremap', 'silent'})
