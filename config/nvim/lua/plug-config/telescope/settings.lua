require('telescope').load_extension('media_files')
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules/.*",
      "secret.d/.*",
      "%.pem"
    }
  }
}
