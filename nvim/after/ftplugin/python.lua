local root_files = {
  "pyproject.toml",
  "setup.py",
  "setup.cfg",
  "requirements.txt",
  "Pipfile",
  "pyrightconfig.json",
}

local paths = vim.fs.find(root_files, {
  stop = vim.uv.os_homedir(),
  upward = true,
  type = "file",
})

require("lsp-util").setup_lsp({
  name = "pyright",
  cmd = { "pyright-langserver", "--stdio" },
  root_dir = vim.fs.dirname(paths[1]),
  single_file_support = true,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
})

-- As Pyright doesn't support formatting, we have to define a the format keymap
vim.keymap.set("n", "<space><space>", "<cmd>silent !black %<cr>", { buffer = true, noremap = true })
