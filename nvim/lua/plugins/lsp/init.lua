return
{
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
        require('lspconfig.ui.windows').default_options.border = "rounded"

        local servers = opts.servers
        local function on_attach(client, bufnr)
            require("plugins.lsp.keymaps").attach(bufnr)
        end
        local handlers =  {
            ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
            ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded" }),
        }
        local capabilities = vim.tbl_deep_extend("force", {},
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities(),
        opts.capabilities or {}
        )

        local lspconfig = require("lspconfig")
        for server, config in pairs(opts.servers) do
            lspconfig[server].setup(vim.tbl_deep_extend("force", {
                on_attach = on_attach,
                capabilities = capabilities,
                handlers = handlers
            }, config))
        end

        -- Kinda dirty because it does not apply every time we change the colorscheme, only at startup
        -- vim.api.nvim_set_hl(0, "@lsp.typemod.macro.defaultLibrary", { link = "@function.macro" }) -- Because we hate orange here
        -- vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#eebebe" }) -- Orange -> Soft peach

    end,
    opts = {
        servers = {
            cmake = {},
            gopls = {},
            tsserver = {},
            rust_analyzer = {
                cmd = { "rustup", "run", "stable", "rust-analyzer" },
                settings = {
                    ["rust-analyzer"] = {
                        allFeatures = true,
                        workbench = {
                            colorTheme = "Catppuccin",
                        }
                    },
                },
            },
            clangd = {
                settings = {
                    ['clangd'] = {
                        formatting = {
                            command = { "clang-format --style=file" },
                        },
                    },
                },
            },
            pyright = {
                settings = {
                    ['pyright'] = {
                        formatting = {
                            command = { "black -l 120" },
                        },
                    },
                },
            },
            nil_ls = {
                rootPatterns = {"flake.nix"},
                settings = {
                    ['nil'] = {
                        formatting = {
                            command = { "nixpkgs-fmt" },
                        },
                    },
                },
            },
        }
    }
}
