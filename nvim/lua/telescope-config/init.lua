local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gg', builtin.live_grep, {})

require("telescope").setup {
  defaults = {
      layout_config = {
          horizontal = {
              prompt_position = "top",
          },
      },
      file_ignore_patterns = { "node_modules" },
  },
  pickers = {
      find_files = {
          theme = "ivy",
          find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--exclude", ".git"}
      },
      git_files = {
          theme = "ivy",
      },
  }
}
