return {
  {
    "tpope/vim-fugitive",
    cmd = "G",
    --ft = "gitcommit"
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = {
          hl = "GitSignsChange",
          text = "│",
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
        delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = {
          hl = "GitSignsDelete",
          text = "‾",
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        changedelete = {
          hl = "GitSignsChange",
          text = "~",
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
        untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    cmd = "Neogit",
    ft = "gitcommit",
    keys = {
      { "<leader>g", "<cmd>Neogit<cr>", desc = "neogit" },
    },
    opts = {
      integrations = {
        diffview = true,
        telescope = true,
      },
      disable_commit_confirmation = true,
    },
  },
}
