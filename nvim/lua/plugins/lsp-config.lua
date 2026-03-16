return {
  {
    "williamboman/mason.nvim",
    opts = {}, -- Calls require("mason").setup() automatically
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "clangd", "ts_ls" }, -- "tsserver" was renamed to "ts_ls"
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- 1. Use vim.lsp.enable() to activate servers globally
      -- This works best with nvim-lspconfig as it provides the default server definitions.
      vim.lsp.enable({ "lua_ls", "clangd", "ts_ls" })

      -- 2. Modern LspAttach autocmd for keymaps (the modern replacement for on_attach)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        end,
      })
    end
  },
}

