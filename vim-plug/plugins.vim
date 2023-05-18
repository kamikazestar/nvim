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
    Plug 'kdheepak/lazygit.nvim'
    " Plug 'mhinz/vim-signify'
    Plug 'lewis6991/gitsigns.nvim'

    " terraform
    "Plug 'hashivim/vim-terraform'
    "Plug 'vim-syntastic/syntastic'
    "Plug 'juliosueiras/vim-terraform-completion'

    " Golang
    Plug 'ray-x/go.nvim'
    Plug 'ray-x/guihua.lua'
    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'theHamsta/nvim-dap-virtual-text'
    Plug 'nvim-telescope/telescope-dap.nvim'

    " Spell checking
    "Plug 'sedm0784/vim-you-autocorrect'
    
    " markdown-preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

    " Vimwiki
    Plug 'vimwiki/vimwiki'
    Plug 'plasticboy/vim-markdown'

call plug#end()

" Plugins configuration
" Go
lua << EOF
    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
            require('go.format').goimport()
        end,
        group = format_sync_grp,
    }
)
EOF
 
lua << EOF
    require('go').setup({
    disable_defaults = false, -- true|false when true set false to all boolean settings and replace all table
    -- settings with {}
    go='go', -- go command, can be go[default] or go1.18beta1
    goimport='gopls', -- goimport command, can be gopls[default] or goimport
    fillstruct = 'gopls', -- can be nil (use fillstruct, slower) and gopls
    gofmt = 'gofumpt', --gofmt cmd,
    max_line_len = 128, -- max line length in golines format, Target maximum line length for golines
    tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
    tag_options = 'json=omitempty', -- sets options sent to gomodifytags, i.e., json=omitempty
    gotests_template = "", -- sets gotests -template parameter (check gotests for details)
    gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
    comment_placeholder = '' ,  -- comment_placeholder your cool placeholder e.g. ﳑ       
    icons = {breakpoint = '🧘', currentpos = '🏃'},  -- setup to `false` to disable icons setup
    verbose = false,  -- output loginf in messages
    lsp_cfg = false, -- true: use non-default gopls setup specified in go/lsp.lua
                     -- false: do nothing
                     -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
                     --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
    lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
    lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
                         --      when lsp_cfg is true
                         -- if lsp_on_attach is a function: use this function as on_attach function for gopls
    lsp_keymaps = true, -- set to false to disable gopls/lsp keymap
    lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
    -- function(bufnr)
    --    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
    -- end
    -- to setup a table of codelens
    lsp_diag_hdlr = true, -- hook lsp diag handler
    lsp_diag_underline = true,
    -- virtual text setup
    lsp_diag_virtual_text = { space = 0, prefix = "" },
    lsp_diag_signs = true,
    lsp_diag_update_in_insert = false,
    lsp_document_formatting = true,
    -- set to true: use gopls to format
    -- false if you want to use other formatter tool(e.g. efm, nulls)
    lsp_inlay_hints = {
      enable = true,
      -- Only show inlay hints for the current line
      only_current_line = false,
      -- Event which triggers a refersh of the inlay hints.
      -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
      -- not that this may cause higher CPU usage.
      -- This option is only respected when only_current_line and
      -- autoSetHints both are true.
      only_current_line_autocmd = "CursorHold",
      -- whether to show variable name before type hints with the inlay hints or not
      -- default: false
      show_variable_name = true,
      -- prefix for parameter hints
      parameter_hints_prefix = " ",
      show_parameter_hints = true,
      -- prefix for all the other hints (type, chaining)
      other_hints_prefix = "=> ",
      -- whether to align to the lenght of the longest line in the file
      max_len_align = false,
      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,
      -- whether to align to the extreme right or not
      right_align = false,
      -- padding from the right if right_align is true
      right_align_padding = 6,
      -- The color of the hints
      highlight = "Comment",
    },
    gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
    gopls_remote_auto = true, -- add -remote=auto to gopls
    gocoverage_sign = "█",
    sign_priority = 5, -- change to a higher number to override other signs
    dap_debug = true, -- set to false to disable dap
    dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
                             -- false: do not use keymap in go/dap.lua.  you must define your own.
                             -- windows: use visual studio keymap
    dap_debug_gui = {}, -- bool|table put your dap-ui setup here set to false to disable
    dap_debug_vt = { enabled_commands = true, all_frames = true }, -- bool|table put your dap-virtual-text setup here set to false to disable

    dap_port = 38697, -- can be set to a number, if set to -1 go.nvim will pickup a random port
    dap_timeout = 15, --  see dap option initialize_timeout_sec = 15,
    dap_retries = 20, -- see dap option max_retries
    build_tags = "tag1,tag2", -- set default build tags
    textobjects = true, -- enable default text jobects through treesittter-text-objects
    test_runner = 'go', -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
    verbose_tests = true, -- set to add verbose flag to tests deprecated, see '-v' option
    run_in_floaterm = false, -- set to true to run in float window. :GoTermClose closes the floatterm
                             -- float term recommend if you use richgo/ginkgo with terminal color

    floaterm = {   -- position
      posititon = 'auto', -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
      width = 0.45, -- width of float window if not auto
      height = 0.98, -- height of float window if not auto
    },
    trouble = false, -- true: use trouble to open quickfix
    test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only
    luasnip = false, -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
    --  Do not enable this if you already added the path, that will duplicate the entries
    on_jobstart = function(cmd) _=cmd end, -- callback for stdout
    on_stdout = function(err, data) _, _ = err, data end, -- callback when job started
    on_stderr = function(err, data)  _, _ = err, data  end, -- callback for stderr
    on_exit = function(code, signal, output)  _, _, _ = code, signal, output  end, -- callback for jobexit, output : string
})
    -- local protocol = require'nvim.lsp.protocol'
    -- require("go.format").gofmt()
    require("go.format").goimport()
EOF

" Gitsigns
lua << EOF
    require('gitsigns').setup {
		signs = {
 		   add          = { text = '│' },
 		   change       = { text = '│' },
 		   delete       = { text = '_' },
 		   topdelete    = { text = '‾' },
 		   changedelete = { text = '~' },
 		   untracked    = { text = '┆' },
 		 },
 		 signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
 		 numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
 		 linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
 		 word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
 		 watch_gitdir = {
 		   interval = 1000,
 		   follow_files = true
 		 },
 		 attach_to_untracked = true,
 		 current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
 		 current_line_blame_opts = {
 		   virt_text = true,
 		   virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
 		   delay = 1000,
 		   ignore_whitespace = false,
 		 },
 		 current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
 		 sign_priority = 6,
 		 update_debounce = 100,
 		 status_formatter = nil, -- Use default
 		 max_file_length = 40000, -- Disable if file is longer than this (in lines)
 		 preview_config = {
 		   -- Options passed to nvim_open_win
 		   border = 'single',
 		   style = 'minimal',
 		   relative = 'cursor',
 		   row = 0,
 		   col = 1
 		 },
 		 yadm = {
 		   enable = false
 		 },
		 on_attach = function(bufnr)
		    local gs = package.loaded.gitsigns
		
		    local function map(mode, l, r, opts)
		      opts = opts or {}
		      opts.buffer = bufnr
		      vim.keymap.set(mode, l, r, opts)
		    end
		
		    -- Navigation
		    map('n', ']c', function()
		      if vim.wo.diff then return ']c' end
		      vim.schedule(function() gs.next_hunk() end)
		      return '<Ignore>'
		    end, {expr=true})
		
		    map('n', '[c', function()
		      if vim.wo.diff then return '[c' end
		      vim.schedule(function() gs.prev_hunk() end)
		      return '<Ignore>'
		    end, {expr=true})
		
		    -- Actions
		    map('n', '<leader>hs', gs.stage_hunk)
		    map('n', '<leader>hr', gs.reset_hunk)
		    map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end)
		    map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end)
		    map('n', '<leader>hS', gs.stage_buffer)
		    map('n', '<leader>hu', gs.undo_stage_hunk)
		    map('n', '<leader>hR', gs.reset_buffer)
		    map('n', '<leader>hp', gs.preview_hunk)
		    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
		    map('n', '<leader>tb', gs.toggle_current_line_blame)
		    map('n', '<leader>hd', gs.diffthis)
		    map('n', '<leader>hD', function() gs.diffthis('~') end)
		    map('n', '<leader>td', gs.toggle_deleted)
		
		    -- Text object
		    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
		  end
	}
EOF

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
