-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
        -- Color scheme
        { import = 'user.plugins.tokyonight' },

        -- Navigate seamlessly between Vim windows and Tmux panes.
        -- { 'christoomey/vim-tmux-navigator' },

        -- A wiki in vim, good for quick note taking
        { "vimwiki/vimwiki", lazy = false },

        -- Automatically create parent dirs when saving.
        { 'jessarcher/vim-heritage' },

        -- Fuzzy finder
        { import = 'user.plugins.telescope', lazy = false },

        -- File tree sidebar
        { import = 'user.plugins.neo-tree' },

        -- A Status line.
        { import = 'user.plugins.lualine' },

        -- Display buffers as tabs.
        { import = 'user.plugins.bufferline' },

        -- Display indentation lines.
        { import = 'user.plugins.indent-blankline' },

        -- Improved syntax highlighting
        { import = 'user.plugins.treesitter' },

        -- Language Server Protocol.
        { import = 'user.plugins.lspconfig' },

        -- Completion
        { import = 'user.plugins.cmp' },

        -- GitHub Copilot
        { import = 'user.plugins.copilot' },
    },
    {
        checker = {
            enabled = true,
            notify = false,
        },
        change_detection = {
            notify = false,
        },
        --[[
  install = {
    colorscheme = { "tokyonight", "habamax" },
  },
--]]
    })
