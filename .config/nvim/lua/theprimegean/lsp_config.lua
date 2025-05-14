-- lsp.lua
local lspconfig = require('lspconfig')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()
mason_lspconfig.setup({
    ensure_installed = { 'pyright', 'ts_ls', 'lua_ls' ,'html','emmet_ls','clangd'} -- Use 'ts_ls' instead of 'tsserver'
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Define the on_attach function
local on_attach = function(client, bufnr)
    -- Helper function to set key bindings
    local function buf_set_keymap(mode, key, result)
        vim.api.nvim_buf_set_keymap(bufnr, mode, key, result, { noremap = true, silent = true })
    end

    -- Key bindings for LSP actions
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')       -- Go to definition
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')             -- Show hover information
    buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>')   -- Go to implementation
    buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>')   -- Rename symbol
    buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>')       -- Find references
    buf_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>') -- Show code actions
    buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>') -- Go to previous diagnostic
    buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>') -- Go to next diagnostic
end

-- Set up LSP servers with the on_attach function
mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end,
})

