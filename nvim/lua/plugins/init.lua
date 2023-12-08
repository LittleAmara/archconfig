return {
  { "folke/lazy.nvim" },
  {
    "folke/flash.nvim",
    event = { "VeryLazy" },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
    opts = {
      modes = {
        char = {
          enabled = false,
        },
        search = {
          enabled = false,
        },
      },
      search = {
        forward = false,
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-w>h", "<cmd>TmuxNavigateLeft<cr>", desc = "Switch to left pane" },
      { "<C-w>l", "<cmd>TmuxNavigateRight<cr>", desc = "Switch to right pane" },
      { "<C-w>k", "<cmd>TmuxNavigateUp<cr>", desc = "Switch to up pane" },
      { "<C-w>j", "<cmd>TmuxNavigateDown<cr>", desc = "Switch to down pane" },
    },
  },
  {
    "stevearc/oil.nvim",
    opts = {
      columns = {
        "icon",
        "permissions",
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
          return (name == "..")
        end,
      },
      float = {
        win_options = {
          winblend = 0,
        },
      },
    },
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
      { "<leader>-", "<cmd>Oil --float<cr>", desc = "Open parent directory in a floating window" },
    },
  },
  {
    dir = "/home/amara/neovim_plugins/make.nvim",
    lazy = false,
  },
  {
    "rebelot/kanagawa.nvim",
  },
}
