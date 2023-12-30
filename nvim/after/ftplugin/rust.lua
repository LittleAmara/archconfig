vim.opt.makeprg = "cargo build"

local root_files = { "Cargo.toml", ".git" }

local paths = vim.fs.find(root_files, {
  stop = vim.uv.os_homedir(),
  upward = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.experimental = {
  serverStatusNotification = true,
}

require("lsp-util").setup_lsp({
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = vim.fs.dirname(paths[1]),
  capabilities = capabilities,
})
