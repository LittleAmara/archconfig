return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  lazy = true,
  cmd = "Telescope",
  keys = {
    { "<leader>t", "<cmd>Telescope<cr>", desc = "Telescope" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find file" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Telescope git files" },
    { "<leader>fs", "<cmd>Telescope git_status<cr>", desc = "Telescope git status" },
    { "<leader>G", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
  },
  opts = {
    defaults = {
      layout_config = {
        horizontal = {
          prompt_position = "bottom",
        },
      },
      file_ignore_patterns = { "node_modules" },
    },
    pickers = {
      find_files = {
        find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--exclude", ".git" },
      },
    },
  },
}
