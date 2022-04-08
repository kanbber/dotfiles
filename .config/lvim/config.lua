--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "info"
lvim.format_on_save = true
vim.opt.cmdheight = 1
vim.opt.clipboard = "unnamedplus"
vim.opt.showtabline = 2
lvim.colorscheme = "onedarker"
lvim.builtin.dashboard.custom_header = {" "}
vim.opt.spell = false
vim.opt.wrap = true
vim.opt.spelllang = "en"

vim.opt.colorcolumn= {120}

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-e>"] = "lua vim.lsp.buf.code_action()<CR>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  -- for input mode
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  -- for normal mode
  lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
end

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics <cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

lvim.builtin.which_key.mappings["T"] = {
  name = "+Test",
  n = { "<cmd>TestNearest -strategy=neovim<cr>", "Test NEAREST" },
  a = { "<cmd>TestLast -strategy=neovim<cr>", "Test LAST AGAIN" },
  A = { "<cmd>TestSuite -strategy=neovim<cr>", "Test ALL" },
  f = { "<cmd>TestFile -strategy=neovim<cr>", "Test FILE" },
  v = { "<cmd>TestVisit -strategy=neovim<cr>", "VISIT Test" },
}

lvim.builtin.which_key.mappings["r"] = { "<cmd>set norelativenumber!<CR>", "Relative line nums" }
lvim.builtin.which_key.mappings["f"] = { "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", "Find File" }
lvim.builtin.which_key.mappings["m"] = { "<cmd>MaximizerToggle!<CR>", "Toggle maximizer" }
lvim.builtin.which_key.mappings["h"] = { "<C-W>s", "Split below" }
lvim.builtin.which_key.mappings["v"] = { "<C-W>v", "Split right" }
lvim.builtin.which_key.mappings.t["T"] = { "<cmd>TodoTrouble<CR>", "TODO, FIX, HACKS... " }
lvim.builtin.which_key.mappings["H"] = { "<cmd>nohlsearch<CR>", "No Highlight" }
lvim.builtin.which_key.mappings["C"] = { "<cmd>Telescope commands theme=get_ivy<CR>", "Comands" }
lvim.builtin.which_key.mappings["1"] = { "<cmd>TagbarToggle<CR>", "Comands" }

lvim.builtin.which_key.mappings.g["g"] = { "<cmd>LazyGit<CR>", "LazyGit" }

lvim.builtin.dashboard.custom_section["w"] = {
  description = { "  VimWiki             " },
  command = ":VimwikiIndex",
}

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
lvim.lsp.null_ls.setup = {
  root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
}
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)

--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "black",
    filetypes = { "python" },
    args = { "--line-length", "119"}
  },
  -- { exe = "isort", filetypes = { "python" } },
  {
    exe = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    args = { "--print-width", "119" , "--prose-wrap", "preserve"},
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "json", "typescriptreact" },
  },
  {
    exe='eslint_d',
    filetypes = { "typescript"}
  }
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "flake8", filetypes = { "python" }, args = {'--max-line-length=119'}},
    -- exe = "shellcheck",
  -- {
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   args = { "--severity", "warning" },
  -- },
  {
    exe='eslint_d',
    filetypes = { "typescript"}
  },
  {
    exe = "codespell",
    args = { "--severity", "info" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "javascript", "python" },
  },
}

-- Relative Numbering
vim.cmd("set norelativenumber!")

-- Additional Plugins
lvim.plugins = {
--     {"folke/tokyonight.nvim"},
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {"shinglyu/vim-codespell"},
    {"szw/vim-maximizer"},
    {"ThePrimeagen/vim-be-good"},
    {"justinmk/vim-sneak"},
    {"sbdchd/neoformat"},
    {"vim-test/vim-test"},
    {"vimwiki/vimwiki"},
    {"preservim/tagbar"},
    {"kdheepak/lazygit.nvim"},
    {"roxma/nvim-yarp"},
    {"gelguy/wilder.nvim", requires = {'romgrk/fzy-lua-native'} },
    {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
      require("todo-comments").setup {
      }
      end
    },
    { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
}

vim.g.vimwiki_list = {{path = '~/Documents/zettelkasten', name = "VimWiki", index = 'vimWiki_start', syntax = 'markdown', ext = '.md'}}

local wilder = require('wilder')
wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
      fuzzy = 1,
      set_pcre2_pattern = 1,
    }),
    wilder.python_search_pipeline({
      pattern = 'fuzzy',
    })
  ),
})
local highlighters = {
  wilder.pcre2_highlighter(),
  wilder.basic_highlighter(),
}
wilder.set_option('renderer', wilder.renderer_mux({
  [':'] = wilder.popupmenu_renderer({
    highlighter = highlighters,
  }),
  ['/'] = wilder.wildmenu_renderer({
    highlighter = highlighters,
  }),
}))
wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    highlights = {
      border = 'Normal', -- highlight to use for the border
    },
    border = 'rounded',
    pumblend = 40,
  })
))

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
}
