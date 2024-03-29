" Buffers
" Navigate between buffers
nmap bn :bnext<CR>
nmap bp :bprevious<CR>
nmap bd :bdelete<CR>
" Show/hide blank characters
nmap <F2> :set invlist<CR>
imap <F2> <ESC>:set invlist<CR>
" Toggle no-paste
nnoremap <F8> :set invpaste paste?<CR>
" Enable spell checking
"nnoremap <F7> :set spell! <CR>
"inoremap <F7> <C-o> :set spell! <CR>
" Source init.vim
nnoremap <space><CR> :so ~/.config/nvim/init.vim<CR>
" Mapping to run LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>
" Mapping for Floaterm
nnoremap  <C-A-t> :FloatermToggle<CR>
tnoremap <C-A-t> <C-\><C-n>:FloatermToggle<CR>
" Mapping for nvim-tree
nnoremap <silent> <C-A-n> :NvimTreeToggle<CR>
" FZF
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fr <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fg <cmd>Telescope git_commits<cr>
nnoremap <leader>fgb <cmd>Telescope git_branches<cr>
" Barbar configuration
" Move to previous/next
nnoremap <C-,> :BufferPrevious<CR>
nnoremap <C-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <C-A-,> :BufferMovePrevious<CR>
nnoremap <C-A-.> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <C-1> :BufferGoto 1<CR>
nnoremap <C-2> :BufferGoto 2<CR>
nnoremap <C-3> :BufferGoto 3<CR>
nnoremap <C-4> :BufferGoto 4<CR>
nnoremap <C-5> :BufferGoto 5<CR>
nnoremap <C-6> :BufferGoto 6<CR>
nnoremap <C-7> :BufferGoto 7<CR>
nnoremap <C-8> :BufferGoto 8<CR>
nnoremap <C-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <A-p> :BufferPin<CR>
" Close buffer
nnoremap <A-c> :BufferClose<CR>
" Sort automatically by...
nnoremap <silent> <leader>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <leader>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <leader>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <leader>bw :BufferOrderByWindowNumber<CR>
" End BarBar configuration

" VimWiki
" Default keybindings for diary (<leader>w<leader>w) wasn't working
" Open diary index
nmap <leader>di <Plug>VimwikiDiaryIndex
" Open today diar
nmap <leader>dn <Plug>VimwikiMakeDiaryNote
nmap <leader>db <Plug>VimwikiTabMakeDiaryNote
" Open tomorrow diary
nmap <leader>dt <Plug>VimwikiMakeTomorrowDiaryNote
" Opent yesterday diary
nmap <leader>dy <Plug>VimwikiMakeYesterdayDiaryNote
" Common Go commands
"au FileType go nmap <leader>r <Plug>(go-run)
"au FileType go nmap <leader>b <Plug>(go-build)
"au FileType go nmap <leader>t <Plug>(go-test)
"au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
"au FileType go nmap <Leader>e <Plug>(go-rename)
"au FileType go nmap <Leader>s <Plug>(go-implements)
"au FileType go nmap <Leader>i <Plug>(go-info)
" Go navigation commands
"au FileType go nmap <Leader>ds <Plug>(go-def-split)
"au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" Alternate commands
"au FileType go nmap <Leader>ae <Plug>(go-alternate-edit)
"au FileType go nmap <Leader>av <Plug>(go-alternate-vertical)

" markdown-preview
nmap <C-m> <Plug>MarkdownPreviewToggle

" Some usefull keybindings
" "Paste without replacing the default register
vnoremap <leader>p "_dP
" Copy to clipboard
vnoremap <leader>y "+y
" Prepare to yank large part of code using Vim motions
nnoremap <leader>y "+y
" Copy content of entire file to the clipboard
nnoremap <leader>Y gg"+yG
" Move line up/down
vnoremap <leader>J :m '>+1<CR>gv=gv
vnoremap <leader>K :m '<-2<CR>gv=gv
" Clear search highlight
nnoremap <leader>h :nohlsearch<CR>

