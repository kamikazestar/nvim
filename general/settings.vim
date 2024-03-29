map <Space> <Leader>
set iskeyword+=-            " Treat dash separated words as a word text object

syntax enable               " Enable syntax hightlighting
set nowrap                  " Do not wrap lines - display long lines as a single line
set encoding=utf-8          " Encoding displayed
set pumheight=10            " Makes popup menu smaller
set fileencoding=utf-8      " Encoding writtent to a file
set shiftwidth=4            " Tabspacing to 4 characters for indents
set tabstop=4
set softtabstop=4
set guicursor=
set smarttab                " Smart tabbing will realize you have 2 vs 4
set expandtab               " Convert tabs to spaces
set smartindent             " Enable smart indenting
set cursorline              " Enable highlighting of the cursor line
set laststatus=2            " Always display the status line
set clipboard=unnamed       " Set the clipboard to pbcopy
set lcs+=space:.            " Set the blank character to '.'
set formatoptions-=cro      " Stop newline continution of comments
set t_Co=256                " Support 256 colors
set termguicolors           " Sets terminal gui colors
set spelllang=en            " Configure spell checking " Disabling Polish spell checking due to the issue with encoding.
set mouse+=a                " Enable mouse for barbar plugin
set nofoldenable            " Disable folding
set scrolloff=8             " Scroll when you 8 lines away from the center of the text
set number                  " Show line numbers
set relativenumber          " Show relative line numbers

" Store all .swp files in one directory
set directory^=$HOME/.vim/swap//

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"Popup window for Go Doc
let g:go_doc_popup_window = 1

"Theme
let g:dracula_colorterm=0
colorscheme dracula_pro

" Utilsnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
