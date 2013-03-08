set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'

" To investigate:
" tpope/vim-scriptease
" tpope/vim-commentary

let snippets_dir = '~/.vim/snippets'
filetype plugin indent on

" General
set undodir=/tmp
set cm=blowfish
set t_Co=256
set nowrap
set history=200
set undolevels=2000
set ttyfast
set noerrorbells
set visualbell t_vb=
set lazyredraw
set scrolloff=5
set nostartofline
set shell=bash
set nofoldenable
let mapleader="\<space>"

" Theming
syntax enable
set background=dark
colorscheme solarized

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


" Searching
set nohlsearch
set showmatch
set ignorecase
set smartcase

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Status bar etc.
set showcmd
set ruler
highlight MatchParen ctermbg=4

" Spell checking
if version >= 700
  set spl=en spell
  set nospell
endif

" Swap ; and :
nnoremap ; :
nnoremap : ;

" Highlight current line
set cul

" Typo mitigation
command! WQ wq
command! Wq wq
command! W w
command! Q q

" Indent paragraph
nnoremap Q gq}

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

" sudo write
noremap <Leader>w :w !sudo tee % > /dev/null
noremap <Leader>s :source ~/.vimrc<Enter>
noremap <Leader>gc :Gcommit<Enter>
noremap <Leader>gd :Gdiff<Enter><C-w>h
noremap <Leader>gg :diffget<Enter>:diffupdate<Enter>
noremap <Leader>gp :diffput<Enter>:diffupdate<Enter>
noremap <Leader>gl :Git log<Enter>
noremap <Leader>gr :Gread<Enter>
noremap <Leader>gs :Gstatus<Enter>
noremap <Leader>gw :Gwrite<Enter>
noremap <Leader>h <C-w>h
noremap <Leader>j <C-w>j
noremap <Leader>k <C-w>k
noremap <Leader>l <C-w>l
noremap <Leader>q @q
