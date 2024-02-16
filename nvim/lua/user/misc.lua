-- Use internal formatting for bindings like gq
 vim.api.nvim_create_autocmd('LspAttach', {
   callback = function(args)
     vim.bo[args.buf].formatexpr = nil
  end,
 })
