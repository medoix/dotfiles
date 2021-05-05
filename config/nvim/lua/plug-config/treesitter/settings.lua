local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
    ensure_installed = {
        "bash",
        "go"
    },
    highlight = {
        enable = true
    }
}
