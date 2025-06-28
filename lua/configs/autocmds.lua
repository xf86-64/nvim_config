vim.api.nvim_create_autocmd({"FocusGained", "BufEnter", "CursorHold"}, 
{
    command = "checktime",
})
vim.api.nvim_create_autocmd("BufWritePre", {

    callback = function()
        vim.lsp.buf.format
        {
            async = false
        }
    end,
})

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {focusable=false})
    end
})
