-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    git = {url_format = "git@github.com:%s.git",
            throttle = {
      enabled = true, -- not enabled by default
      -- max 2 ops every 5 seconds
      rate = 2,
      duration = 5 * 1000, -- in ms
    },
    },
        -- Color scheme
        { import = 'user.plugins.tokyonight' },

        -- Navigate seamlessly between Vim windows and Tmux panes.
        -- { 'christoomey/vim-tmux-navigator' },

        -- A wiki in vim, good for quick note taking
        { import = 'user.plugins.vimwiki' },

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
        -- { import = 'user.plugins.copilot' },

        -- Avante AI
        { import = 'user.plugins.avante' },

        -- Csv
        { import = 'user.plugins.csvview' },

        -- debugging
        { import = 'user.plugins.vimspector' },
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
