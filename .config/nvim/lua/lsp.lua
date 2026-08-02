require("mason").setup()

require("mason-tool-installer").setup({
    ensure_installed = {
        "pyright",
        "typescript-language-server",
        "rust-analyzer",
        "texlab",
        "ltex-ls",
        "svelte-language-server",
        "typescript-language-server",
        "eslint-lsp",
        "prettier",
    },
})

vim.lsp.config("ltex", {
    cmd_env = {
        JAVA_HOME = "/usr/lib/jvm/java-21-openjdk",
    },
})

vim.lsp.enable("pyright")
vim.lsp.enable("ts_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("texlab")
vim.lsp.enable("ltex")
vim.lsp.enable("lua_ls")
vim.lsp.enable("svelte")

require("blink.cmp").setup({
    keymap = {
        ["<CR>"] = {
            "accept",
            "fallback",
        },
        ["<Down>"] = { "select_next", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
    },

    completion = {
        list = {
            selection = {
                preselect = false,
                auto_insert = false,
            },
        },
    },

    sources = {
        default = {
            "lsp",
            "path",
            "snippets",
            "buffer",
        },
    },
})


vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
vim.keymap.set("n", "J", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>s", vim.lsp.buf.code_action)

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focus = false,
            scope = "cursor",
        })
    end,
})
