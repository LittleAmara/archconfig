return
{
    'nvim-treesitter/nvim-treesitter',
    tag = "v0.9.0",
    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })
    end,
    event = { "BufReadPost", "BufNewFile", "CmdlineEnter"},
    opts= {
        ensure_installed = {
            "c",
            "cmake",
            "cpp",
            "fish",
            "go",
            "hcl",
            "nix",
            "python",
            "terraform",
            "javascript",
            "markdown",
            "markdown_inline",
            "vim",
            "bash",
            "regex",
            "lua"
        },
        sync_install = false,
        highlight = {
            enable = true,
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
}
