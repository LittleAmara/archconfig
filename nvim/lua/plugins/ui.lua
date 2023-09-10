return {
  {
    "folke/noice.nvim",
    -- event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      messages = {
        enabled = false,
      },
      cmdline = {
        view = "cmdline",
        enabled = false,
      },
      views = {
        mini = {
          align = "message-right",
          position = {
            row = "95%",
            col = "100%",
          },
          border = {
            style = "rounded",
          },
        },
        hover = {
          border = {
            style = "rounded",
          },
          position = { row = 2, col = 0 },
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        long_message_to_split = true,
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
  },
  {
    "goolord/alpha-nvim",
    enabled = false,
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "",
        "          ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ",
        "           ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
        "                 ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ",
        "                  ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
        "                 ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
        "          ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
        "         ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
        "        ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
        "        ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ",
        "             ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
        "              ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
        "",
        "",
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        "",
      }

      local buttonhl = function(shortcut, text, command)
        local button = dashboard.button(shortcut, text, command)
        button.opts.hl_shortcut = "Boolean"
        button.opts.hl = "Array"
        return button
      end

      dashboard.section.buttons.val = {
        buttonhl("n", " > New file", "<cmd>ene<cr>"),
        buttonhl("d", "󰉋 > Open directory", "<cmd>e .<cr>"),
        buttonhl("f", "󰱽 > Find files", "<cmd>Telescope find_files<cr>"),
        buttonhl("g", " > Git", "<cmd>Neogit kind=replace<cr>"),
        buttonhl("t", " > Telescope", "<cmd>Telescope<cr>"),
        buttonhl("p", "󰚥 > Plugins", "<cmd>Lazy<cr>"),
        buttonhl("P", " > Profile", "<cmd>Lazy profile<cr>"),
        buttonhl("q", " > Quit", "<cmd>qa<cr>"),
      }

      dashboard.section.header.opts.hl = "Array"
      dashboard.section.footer.opts.hl = "Function"

      dashboard.section.footer.val = {
        "",
        "",
        "Theories are nothing more than words. Accept what you’ve seen.",
        "",
        "                                                        – Rintaro Okabe",
      }

      alpha.setup(dashboard.opts)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local lualine = require("lualine")
      local colors = require("catppuccin.palettes").get_palette("frappe")

      -- Utils fonctions
      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }

      local config = {
        options = {
          -- Disable sections and component separators
          component_separators = "",
          section_separators = "",
          icons_enabled = true,
          theme = {
            normal = { c = { fg = colors.text, bg = colors.mantle } },
            inactive = { c = { fg = colors.text, bg = colors.mantle } },
          },
        },
        sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          -- These will be filled later
          lualine_c = {},
          lualine_x = {},
        },
        inactive_sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
      }

      -- Inserts a component in lualine_c at left section
      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      -- Inserts a component in lualine_x at right section
      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      -- Left section
      ins_left({
        -- mode component
        "mode",
        color = function()
          -- auto change color according to neovims mode
          local mode_color = {
            n = colors.red,
            i = colors.teal,
            v = colors.blue,
            [""] = colors.blue,
            V = colors.blue,
            c = colors.pink,
            no = colors.red,
            s = colors.peach,
            S = colors.peach,
            [""] = colors.peach,
            ic = colors.yellow,
            R = colors.mauve,
            Rv = colors.mauve,
            cv = colors.red,
            ce = colors.red,
            r = colors.teal,
            rm = colors.teal,
            ["r?"] = colors.teal,
            ["!"] = colors.red,
            t = colors.red,
          }
          return { fg = mode_color[vim.fn.mode()] }
        end,
        padding = { left = 1, right = 1 },
      })

      ins_left({
        "branch",
        icon = "",
        color = { fg = colors.blue, gui = "bold" },
      })

      ins_left({ "location" })

      ins_left({ "progress", color = { fg = colors.text, gui = "bold" } })

      ins_left({
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " " },
        diagnostics_color = {
          color_error = { fg = colors.red },
          color_warn = { fg = colors.yellow },
          color_info = { fg = colors.teal },
        },
      })

      -- Mid section
      ins_left({
        function()
          return "%="
        end,
      })

      ins_left({
        "filename",
        cond = conditions.buffer_not_empty,
        color = { fg = colors.mauve, gui = "bold" },
        path = 1,
      })

      -- Right section
      ins_right({
        "filetype",
      })

      ins_right({
        "o:encoding",
        fmt = string.upper,
        cond = conditions.hide_in_width,
        color = { fg = colors.blue, gui = "bold" },
      })

      ins_right({
        "fileformat",
        fmt = string.upper,
        color = { fg = colors.blue, gui = "bold" },
      })

      lualine.setup(config)
    end,
  },
}
