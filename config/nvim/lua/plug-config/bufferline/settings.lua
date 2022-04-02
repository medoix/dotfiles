require'bufferline'.setup {
  options = { 
    view = "multiwindow",
    numbers = "ordinal",
    modified_icon = '●',
    tab_size = 18,
    diagnostics = "nvim_lsp",
    separator_style = {'|', ''}
  }
}
