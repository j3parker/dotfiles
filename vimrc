" General
set nocompatible
filetype plugin indent on
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

" Theming
syntax enable
set background=dark
colorscheme solarized

" Indentation
set tabstop=2
set expandtab
set smartindent
set shiftwidth=2

" Searching
set nohlsearch
set showmatch
set incsearch
set ignorecase
set smartcase

" Makefiles
au FileType make setl noexpandtab tabstop=4

" Completion
"set completeopt = menu,menuone,longest
set pumheight =15
let g:SuperTabDefaultCompletionType = "context"
let g:clang_complete_auto = 0
"let g:clang_complete_copen = 1
let g:SuperTabClosePreviewOnPopupClose = 1
set completeopt-=preview
let g:SuperTabNoCompleteAfter = [',', '\s', ';', '/', '^']

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

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

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

" Highlight current line
set cul

" Insert mode moving
imap <C-e> <esc>$i<right>
imap <C-a> <esc>0i

" Insert semicolon at end of line from command mode
nmap : ;s/\([^;]\)$/\1;/<enter>

" CTags
set tags=tags;/

" Typo mitigation
command WQ wq
command Wq wq
command W w
command Q q

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
