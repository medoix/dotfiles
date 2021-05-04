local M = {}

function M.setup() M.autogroups() end

function M.autogroups()
  local function set_augroup()
    vim.api.nvim_command("augroup WrapInMarkdown")
    vim.api.nvim_command("autocmd!")
    vim.api.nvim_command("autocmd FileType markdown setlocal wrap")
    vim.api.nvim_command("augroup END")
  end
end

return M
