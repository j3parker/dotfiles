set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Core
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-repeat'
Bundle 'sjl/gundo.vim.git'
Bundle 'SirVer/ultisnips'
Bundle 'Lokaltog/vim-easymotion'

" theme
Bundle 'twerth/ir_black'

" git
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

" languages
Bundle 'tpope/vim-markdown'
Bundle 'wlangstroth/vim-racket'
Bundle 'groenewege/vim-less'
Bundle 'mxw/vim-jsx'

" lint tools
Bundle 'rhysd/vim-clang-format'
Bundle 'editorconfig/editorconfig-vim'

" Org-mode related things
Bundle 'jceb/vim-orgmode'
Bundle 'vim-scripts/utl.vim'
Bundle 'tpope/vim-speeddating'
Bundle 'mattn/calendar-vim'

"" haven't used in awhile:
" cxiw {move somewhere else} cxiw -> exchange words
Bundle 'tommcdo/vim-exchange'
" a=, a:, a{ ... still needed?
Bundle 'godlygeek/tabular'


" To investigate:
" tpope/vim-scriptease  <-- plugin to help writing plugins
" tpope/vim-commentary  <-- comment/uncomment chunks of text

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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

" Theming
syntax enable
colorscheme ir_black

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

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Status bar etc.
set showcmd
highlight MatchParen ctermbg=4

" Spell checking
set spl=en spell
set nospell

nnoremap ; :
nnoremap : ;

command! WQ wq
command! Wq wq
command! W w
command! Q q

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

map Y y$

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:gundo_return_on_revert = 0

" quotes
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

let mapleader="\<space>"

noremap <Leader>w :w !sudo tee % > /dev/null
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

noremap <leader>a= :Tabularize /=<CR>
noremap <Leader>a: :Tabularize /:\zs<CR>
noremap <Leader>a{ :Tabularize /{<CR>

noremap <Leader>u :GundoToggle<CR>

noremap <Leader>m :w<Bar>!make<CR>

noremap <Leader>f :ClangFormat<CR>

" EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_startofline = 0
nmap s <Plug>(easymotion-s2)

map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)

map  <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)
map  <leader>n <Plug>(easymotion-next)
map  <leader>N <Plug>(easymotion-prev)
