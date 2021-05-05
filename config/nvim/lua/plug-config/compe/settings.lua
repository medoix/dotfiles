require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    -- Built-in
    buffer = true;
    calc = true;
    path = true;
    spell = true;
    tags = true;

    -- Neovim
    nvim_lsp = true;
    nvim_lua = true;

    -- External plugin
    treesitter = true;
    vsnip = true;

    -- External source
    tabnine = true;
  };
}

vim.o.completeopt = "menuone,noselect"
