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
    { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Telescope find file" },
    { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
    { "<leader><space>", "<cmd>Telescope git_files<cr>", desc = "Telescope git files" },
    { "<leader>s", "<cmd>Telescope git_status<cr>", desc = "Telescope git status" },
    { "<leader>G", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
    { "<leader>h", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
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
        theme = "ivy",
      },
      git_files = {
        theme = "ivy",
      },
      help_tags = {
        theme = "dropdown",
        previewer = false,
      },
    },
  },
}
