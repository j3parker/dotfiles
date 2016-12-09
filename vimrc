set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let mapleader="\<space>"

" Core
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-repeat'

" languages
Bundle 'tpope/vim-markdown'
Bundle 'wlangstroth/vim-racket'
Bundle 'groenewege/vim-less'
Bundle 'mxw/vim-jsx'
Bundle 'google/vim-ft-bzl'

"" haven't used in awhile:
" cxiw {move somewhere else} cxiw -> exchange words
Bundle 'tommcdo/vim-exchange'

" To investigate:
" tpope/vim-scriptease  <-- plugin to help writing plugins
" tpope/vim-commentary  <-- comment/uncomment chunks of text

" Editorconfig
Bundle 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Ultisnips
Bundle 'SirVer/ultisnips'
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Theming
Bundle 'twerth/ir_black'
syntax enable
colorscheme ir_black

" Git
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
noremap <Leader>gc :Gcommit<Enter>
noremap <Leader>gd :Gdiff<Enter><C-w>h
noremap <Leader>gl :Git log<Enter>
noremap <Leader>gco :Gread<Enter>
noremap <Leader>gs :Gstatus<Enter>
noremap <Leader>gw :Gwrite<Enter>
noremap <Leader>grm :Gremove<Enter>
noremap <Leader>gmv :Gmove
noremap <Leader>q @q
noremap <leader>ev :vsplit $MYVIMRC<cr>

noremap <Leader>dg :diffget<Enter>:diffupdate<Enter>
noremap <Leader>dp :diffput<Enter>:diffupdate<Enter>
vnoremap <Leader>dp :diffput<Enter>:diffupdate<Enter>
noremap <Leader>du :diffupdate

" Tabularize
Bundle 'godlygeek/tabular'
noremap <leader>a= :Tabularize /=<CR>
noremap <Leader>a: :Tabularize /:\zs<CR>
noremap <Leader>a{ :Tabularize /{<CR>
noremap <Leader>a# :Tabularize /#<CR>
noremap <Leader>a\ :Tabularize /\\<CR>

" Gundo
Bundle 'sjl/gundo.vim.git'
let g:gundo_return_on_revert = 0
noremap <Leader>u :GundoToggle<CR>

" Clang format
Bundle 'rhysd/vim-clang-format'
noremap <Leader>f :ClangFormat<CR>

" EasyMotion
Bundle 'Lokaltog/vim-easymotion'

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_startofline = 0
nmap s <Plug>(easymotion-s2)
nmap <leader>s <Plug>(easymotion-sn)

map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)

""""""""""""""""""""""""""
" Core vim things follow "
""""""""""""""""""""""""""

" General
set undodir=/tmp
set cryptmethod=blowfish
set t_Co=256 " number of colors
set nowrap
set undolevels=2000
set ttyfast
set noerrorbells
set visualbell t_vb=
set lazyredraw
set scrolloff=5
set nostartofline
set nofoldenable
set hidden
set shortmess+=I
set cursorline

" Better defaults
command! WQ wq
command! Wq wq
command! W w
command! Q q
nnoremap ; :
nnoremap : ;

map Y y$

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Custom commands
noremap <Leader>w :w !sudo tee % > /dev/null
noremap <Leader>m :w<Bar>!make<CR>

" Indentation
set expandtab
set smartindent
set tabstop=2
set shiftwidth=2 " XXX future version has sw=0 --> sw=ts, should adopt that
au FileType make setl noexpandtab tabstop=4 sw=4
au FileType tpl setl expandtab tabstop=4 sw=4
au FileType php setl expandtab tabstop=4 sw=4
au FileType html setl expandtab tabstop=4 sw=4
au FileType javascript setl expandtab tabstop=4 sw=4
set breakindent

" Searching
set nohlsearch
set showmatch
set ignorecase
set smartcase

" fancy quotes
function! SetupQuotes()
  iabbrev <C-b>a “
  iabbrev <C-b>b ”
  iabbrev <C-b>c ‘
  iabbrev <C-b>d ’
endfunction

augroup quotes
  autocmd!
  autocmd FileType markdown call SetupQuotes()
augroup END

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Status bar
set showcmd
highlight MatchParen ctermbg=4

" Spell checking
set spl=en spell
set nospell

" Paragraph formatting
set formatprg=par\ -w80
nnoremap Q gq}

" No comment continuing
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Restore cursor to previous position when a file is loaded
set viminfo='25,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
