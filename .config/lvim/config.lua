-- general
lvim.log.level = "debug"
lvim.format_on_save = true
vim.opt.cmdheight = 1
vim.opt.showtabline = 2
vim.opt.clipboard = "unnamedplus"
lvim.colorscheme = "onedarker"
vim.opt.spell = false
vim.opt.wrap = true
vim.opt.spelllang = "en"


vim.opt.colorcolumn = { 100 }
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["∆"] = ":m .+1<CR>=="
lvim.keys.normal_mode["˚"] = ":m .-2<CR>=="
vim.api.nvim_set_keymap('i', '˚', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '∆', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '˚', ":m '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '∆', ":m '>+1<CR>gv-gv", { noremap = true, silent = true })

-- vim.api.nvim_set_option('foldmethod', 'syntax');
vim.api.nvim_command('set foldmethod=syntax');
vim.api.nvim_command('set foldlevel=99');

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
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
lvim.builtin.which_key.mappings.t["r"] = { "<cmd>Telescope lsp_references<CR>", "References.." }
lvim.builtin.which_key.mappings.l["R"] = { '<cmd>lua vim.lsp.buf.execute_command({command = "_typescript.organizeImports", arguments = {vim.fn.expand("%:p")}})<CR>', "Reorder Imports" }
lvim.builtin.which_key.mappings["H"] = { "<cmd>nohlsearch<CR>", "No Highlight" }
lvim.builtin.which_key.mappings["C"] = { "<cmd>Telescope commands theme=get_ivy<CR>", "Comands" }
lvim.builtin.which_key.mappings["1"] = { "<cmd>TagbarToggle<CR>", "Comands" }
-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set additional code actions
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.code_actions.shellcheck,
    -- null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.formatting.eslint_d.with({
      extra_args = { "--rule", "linebreak-style: 0" }
    }),
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.flake8.with({
      extra_args = { "--print-width", "99" },
    }),
    null_ls.builtins.diagnostics.codespell.with({
      extra_args = { "--severity", "info" },
    }),
    null_ls.builtins.code_actions.xo,
    null_ls.builtins.formatting.prettierd.with({
      filetypes = { "javascript", "javascriptreact", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "graphql", "handlebars" },
      extra_args = { "--print-width", "99", "--prose-wrap", "preserve" },
    }),
    null_ls.builtins.completion.spell,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.terrafmt,
  },
})

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
parser_configs.hcl = {
  filetype = "hcl", "terraform",
}

-- Additional Plugins
lvim.plugins = {
  { "folke/tokyonight.nvim" },
  { 'ajmwagar/vim-deus' },
  { "ellisonleao/gruvbox.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "shinglyu/vim-codespell" },
  { "szw/vim-maximizer" },
  { "ThePrimeagen/vim-be-good" },
  {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      })
    end
  },
  { "sbdchd/neoformat" },
  { "vimwiki/vimwiki" },
  { "vim-test/vim-test" },
  {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
      "nvim-neotest/neotest-python"
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-jest')({
            jestCommand = "npm run --"
          }),
          require("neotest-python"),
        }
      })
    end
  },
  { "APZelos/blamer.nvim" },
  { "preservim/tagbar" },
  { "kdheepak/lazygit.nvim" },
  { "roxma/nvim-yarp" },
  { "gelguy/wilder.nvim", requires = { 'romgrk/fzy-lua-native' } },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
      }
    end
  },
  -- { "ThePrimeagen/refactoring.nvim",
  --   requires = {
  --     { "nvim-lua/plenary.nvim" },
  --     { "nvim-treesitter/nvim-treesitter" }
  --   }
  -- },
  { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
  -- { "github/copilot.vim" },
  -- { "zbirenbaum/copilot.lua",
  --   event = { "VimEnter" },
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup {
  --         plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
  --       }
  --     end, 100)
  --   end,
  -- },
  -- { "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua", "nvim-cmp" },
  -- },
  { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' },
  { "tpope/vim-repeat" },
  { "lukas-reineke/indent-blankline.nvim" },
  {
    "tpope/vim-surround",
    keys = { "c", "d", "y" },
    setup = function()
      vim.o.timeoutlen = 500
    end
  },
}

-- hop.nvim
require 'hop'.setup()

-- normal mode (easymotion-like)
vim.api.nvim_set_keymap("n", "rr", "<cmd>HopChar2BC<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "ff", "<cmd>HopChar2AC<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", { noremap = true })
-- visual mode (easymotion-like)
vim.api.nvim_set_keymap("v", "rr", "<cmd>HopChar2AC<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "ff", "<cmd>HopChar2BC<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", { noremap = true })
-- normal mode (sneak-like)
-- vim.api.nvim_set_keymap("n", "s", "<cmd>HopChar2AC<CR>", { noremap = false })
-- vim.api.nvim_set_keymap("n", "S", "<cmd>HopChar2BC<CR>", { noremap = false })

-- visual mode (sneak-like)
-- vim.api.nvim_set_keymap("v", "s", "<cmd>HopChar2AC<CR>", { noremap = false })
-- vim.api.nvim_set_keymap("v", "S", "<cmd>HopChar2BC<CR>", { noremap = false })


vim.api.nvim_command('let g:blamer_enabled = 1');
-- table.insert(lvim.builtin.cmp.sources, { name = "copilot", group_index = 0 })
vim.g.vimwiki_list = { { path = '~/src/github.com/zettelkasten', name = "VimWiki", index = 'vimWiki_start', syntax = 'markdown', ext = '.md' } }

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_lines = 1000;
  max_num_results = 20;
  sort = true;
  run_on_every_keystroke = true;
  snippet_placeholder = '..';
  ignored_file_types = { -- default is not to ignore
    -- uncomment to ignore in lua:
    -- lua = true
  };
  show_prediction_strength = false;
})

local wilder = require('wilder')
wilder.setup({ modes = { ':', '/', '?' } })
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
      border = 'Normal',
    },
    border = 'rounded',
    pumblend = 30,
  })
))

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
}


-- show indentation
vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}
