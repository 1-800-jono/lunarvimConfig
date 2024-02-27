-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- lvim.colorscheme = "srcery"
lvim.colorscheme = "oceanic_material"
-- lvim.colorscheme = "nightvision"
lvim.format_on_save = true
vim.opt.spell = true
vim.opt.list = true
vim.opt.listchars:append({ space = '·' })
lvim.builtin.breadcrumbs.active = false
lvim.transparent_window = true

lvim.plugins = {

  -- Themes
  -- { "lunarvim/colorschemes" },
  { "morhetz/gruvbox" },
  -- { "sainnhe/everforest" },
  { "ajmwagar/vim-deus" },
  { "srcery-colors/srcery-vim" },
  { "franbach/miramare" },
  { "glepnir/oceanic-material" },
  { "mathofprimes/nightvision-nvim" },
  { "neanias/everforest-nvim" },
  { "projekt0n/caret.nvim" },

  -- Git
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 1
      vim.g.gitblame_date_format = '%r'
      vim.g.gitblame_ignored_filetypes = { 'lua' }
    end,
  },

  -- Vim
  { "tpope/vim-surround" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  },
  { "slim-template/vim-slim" },
  { "typicode/bg.nvim",        lazy = false },
  { "kchmck/vim-coffee-script" }
}

-- Mappings
vim.keymap.set("i", "jk", "<Esc>")
lvim.builtin.which_key.mappings.s.t = {
  require('telescope').extensions.live_grep_args.live_grep_args, "Live grep args",
}
lvim.keys.normal_mode["J"] = "5j"
lvim.lsp.buffer_mappings.normal_mode['K'] = nil
lvim.keys.normal_mode["K"] = "5k"
lvim.keys.normal_mode["L"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["H"] = ":BufferLineCyclePrev<CR>"
lvim.keys.term_mode["<C-j>"] = false -- Lazygit uses these
lvim.keys.term_mode["<C-k>"] = false -- Lazygit uses these

-- Prettier configuration
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "prettier",
    filetypes = {
      "javascriptreact",
      "javascript",
    },
  },
}

-- ESLint
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    exe = "eslint",
    filetypes = {
      "javascriptreact",
      "javascript",
    },
  },
}

require('lspconfig').tsserver.setup({
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
})

vim.g.nv_contrast = 'hard'
