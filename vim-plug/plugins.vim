" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'onsails/lspkind-nvim'

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    Plug 'honza/vim-snippets'

    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

    " Todo Comments
	" TODO: Missing keymaping: https://github.com/folke/todo-comments.nvim#jumping
    Plug 'folke/todo-comments.nvim'
        
    " Floaterm
    Plug 'voldikss/vim-floaterm'

    " nvim-tree plugin
    Plug 'nvim-tree/nvim-tree.lua'

    " numbertoggle
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    
    "Add airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Add some color
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'junegunn/rainbow_parentheses.vim'
    
    " Add support for tabs
    Plug 'romgrk/barbar.nvim'

    " SplitJoin plugin
    Plug 'AndrewRadev/splitjoin.vim'

    " sneak
    "Plug 'justinmk/vim-sneak'

    " devicons
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'

    " Git related plugins
    Plug 'mhinz/vim-signify'
    Plug 'kdheepak/lazygit.nvim'

    " terraform
    "Plug 'hashivim/vim-terraform'
    "Plug 'vim-syntastic/syntastic'
    "Plug 'juliosueiras/vim-terraform-completion'

    " Golang
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Spell checking
    "Plug 'sedm0784/vim-you-autocorrect'
    
    " markdown-preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

    " Vimwiki
    Plug 'vimwiki/vimwiki'
    Plug 'plasticboy/vim-markdown'

call plug#end()

" Plugin configuration
" Todo comments
lua << EOF
    require("todo-comments").setup {
        signs = true, -- show icons in the signs column
  		sign_priority = 8, -- sign priority
  		-- keywords recognized as todo comments
		-- TODO: Icon are not available, check why.
  		keywords = {
  		  FIX = {
  		    icon = " ", -- icon used for the sign, and in search results
  		    color = "error", -- can be a hex color, or a named color (see below)
  		    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
  		    -- signs = false, -- configure signs for some keywords individually
  		  },
  		  TODO = { icon = " ", color = "info" },
  		  HACK = { icon = " ", color = "warning" },
  		  WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
  		  PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
  		  NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
  		  TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  		},
  		gui_style = {
  		  fg = "NONE", -- The gui style to use for the fg highlight group.
  		  bg = "BOLD", -- The gui style to use for the bg highlight group.
  		},
  		merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  		-- highlighting of the line containing the todo comment
  		-- * before: highlights before the keyword (typically comment characters)
  		-- * keyword: highlights of the keyword
  		-- * after: highlights after the keyword (todo text)
  		highlight = {
  		  multiline = true, -- enable multine todo comments
  		  multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
  		  multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
  		  before = "", -- "fg" or "bg" or empty
  		  keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
  		  after = "fg", -- "fg" or "bg" or empty
  		  pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
  		  comments_only = true, -- uses treesitter to match keywords in comments only
  		  max_line_len = 400, -- ignore lines longer than this
  		  exclude = {}, -- list of file types to exclude highlighting
  		},
  		-- list of named colors where we try to extract the guifg from the
  		-- list of highlight groups or use the hex color if hl not found as a fallback
		-- TODO: Colors seems to not match configuration. This is probably because of the color scheme.
  		colors = {
  		  error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
  		  warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
  		  info = { "DiagnosticInfo", "#2563EB" },
  		  hint = { "DiagnosticHint", "#10B981" },
  		  default = { "Identifier", "#7C3AED" },
  		  test = { "Identifier", "#FF00FF" }
  		},
  		search = {
  		  command = "rg",
  		  args = {
  		    "--color=never",
  		    "--no-heading",
  		    "--with-filename",
  		    "--line-number",
  		    "--column",
  		  },
  		  -- regex that will be used to match keywords.
  		  -- don't replace the (KEYWORDS) placeholder
  		  pattern = [[\b(KEYWORDS):]], -- ripgrep regex
  		  -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  		},
    }
EOF

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
