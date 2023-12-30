local M = {}

function M.setup_lsp(opts)
  vim.schedule(function()
    local client_id = vim.lsp.start(opts)

    if client_id == nil then
      return
    end

    local client = vim.lsp.get_client_by_id(client_id)

    if client == nil then
      return
    end

    -- Check if the server supports formatting
    if client.server_capabilities.documentFormattingProvider then
      local bufopts = { noremap = true, silent = true, buffer = vim.api.nvim_get_current_buf() }
      vim.keymap.set("n", "<space><space>", function()
        vim.lsp.buf.format({ async = true })
      end, bufopts)
    end
  end)
end

return M
