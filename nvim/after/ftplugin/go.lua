local root_files = { "go.work", "go.mod", ".git" }

local paths = vim.fs.find(root_files, {
  stop = vim.uv.os_homedir(),
  upward = true,
})

require("lsp-util").setup_lsp({
  name = "gopls",
  cmd = { "gopls" },
  root_dir = vim.fs.dirname(paths[1]),
  single_file_support = true,
  settings = {
    gopls = {
      hints = {
        -- assignVariableTypes = true,
        -- compositeLiteralFields = true,
        -- compositeLiteralTypes = true,
        -- constantValues = true,
        -- rangeVariableTypes = true,
        functionTypeParameters = true,
        parameterNames = true,
      },
      semanticTokens = true,
    },
  },
})
