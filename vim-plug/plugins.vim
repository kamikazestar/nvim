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

"Barbar
let g:barbar_auto_setup = v:false " disable auto-setup
lua << EOF
    require'barbar'.setup {
        -- WARN: do not copy everything below into your config!
        --       It is just an example of what configuration options there are.
        --       The defaults are suitable for most people.
      
        -- Enable/disable animations
        animation = true,
      
        -- Enable/disable auto-hiding the tab bar when there is a single buffer
        auto_hide = false,
      
        -- Enable/disable current/total tabpages indicator (top right corner)
        tabpages = false,
      
        -- Enables/disable clickable tabs
        --  - left-click: go to buffer
        --  - middle-click: delete buffer
        clickable = true,
      
        -- Excludes buffers from the tabline
        exclude_ft = {'javascript'},
        exclude_name = {'package.json'},
      
        -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
        -- Valid options are 'left' (the default), 'previous', and 'right'
        focus_on_close = 'left',
      
        -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
        hide = {extensions = false, inactive = false},
      
        -- Disable highlighting alternate buffers
        highlight_alternate = false,
      
        -- Disable highlighting file icons in inactive buffers
        highlight_inactive_file_icons = false,
      
        -- Enable highlighting visible buffers
        highlight_visible = true,
      
        icons = {
          -- Configure the base icons on the bufferline.
          -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
          buffer_index = false,
          buffer_number = false,
          button = '',
          -- Enables / disables diagnostic symbols
          diagnostics = {
            [vim.diagnostic.severity.ERROR] = {enabled = false, icon = 'ﬀ'},
            [vim.diagnostic.severity.WARN] = {enabled = false},
            [vim.diagnostic.severity.INFO] = {enabled = false},
            [vim.diagnostic.severity.HINT] = {enabled = false},
          },
          gitsigns = {
            added = {enabled = true, icon = '+'},
            changed = {enabled = true, icon = '~'},
            deleted = {enabled = true, icon = '-'},
          },
          filetype = {
            -- Sets the icon's highlight group.
            -- If false, will use nvim-web-devicons colors
            custom_colors = false,
      
            -- Requires `nvim-web-devicons` if `true`
            enabled = true,
          },
          separator = {left = '▎', right = '▎'},
      
          -- Configure the icons on the bufferline when modified or pinned.
          -- Supports all the base icon options.
          modified = {button = '●'},
          pinned = {button = '車', filename = true},
      
          -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
          preset = 'default',
      
          -- Configure the icons on the bufferline based on the visibility of a buffer.
          -- Supports all the base icon options, plus `modified` and `pinned`.
          alternate = {filetype = {enabled = false}},
          current = {buffer_index = true},
          inactive = {button = '×'},
          visible = {modified = {buffer_number = false}},
        },
      
        -- If true, new buffers will be inserted at the start/end of the list.
        -- Default is to insert after current buffer.
        insert_at_end = false,
        insert_at_start = false,
      
        -- Sets the maximum padding width with which to surround each tab
        maximum_padding = 4,
      
        -- Sets the minimum padding width with which to surround each tab
        minimum_padding = 1,
      
        -- Sets the maximum buffer name length.
        maximum_length = 30,
      
        -- Sets the minimum buffer name length.
        minimum_length = 0,
      
        -- If set, the letters for each buffer in buffer-pick mode will be
        -- assigned based on their name. Otherwise or in case all letters are
        -- already assigned, the behavior is to assign letters in order of
        -- usability (see order below)
        semantic_letters = true,
      
        -- Set the filetypes which barbar will offset itself for
        sidebar_filetypes = {
          -- Use the default values: {event = 'BufWinLeave', text = nil}
          NvimTree = true,
          -- Or, specify the text used for the offset:
          undotree = {text = 'undotree'},
          -- Or, specify the event which the sidebar executes when leaving:
          ['neo-tree'] = {event = 'BufWipeout'},
          -- Or, specify both
          Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
        },
      
        -- New buffer letters are assigned in this order. This order is
        -- optimal for the qwerty keyboard layout but might need adjustment
        -- for other layouts.
        letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
      
        -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
        -- where X is the buffer number. But only a static string is accepted here.
        no_name_title = nil,
    }
EOF

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
