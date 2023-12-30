vim.opt.shiftwidth = 2

local root_files = { "flake.nix", ".git" }

local paths = vim.fs.find(root_files, {
  stop = vim.uv.os_homedir(),
  upward = true,
})

require("lsp-util").setup_lsp({
  cmd = { "nil" },
  filetypes = { "nix" },
  single_file_support = true,
  root_dir = vim.fs.dirname(paths[1]),
})
