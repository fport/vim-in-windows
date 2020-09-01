set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" -----------------------------
" IMPORTANT:
" Keep Plugin commands between vundle#begin/end.
Plugin 'eslint/eslint'

" plugin on GitHub repo
Plugin 'scrooloose/nerdtree.git'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plugin 'mattn/emmet-vim'
Plugin 'elzr/vim-json'
" Plugin 'minibufexpl.vim'
Plugin 'SuperTab'
Plugin 'AutoComplPop'
Plugin 'surround.vim'
Plugin 'Markdown'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'easymotion/vim-easymotion'
Plugin 'tComment'
Plugin 'ZoomWin'
Plugin 'w0rp/ale'
Plugin 'leafgarland/typescript-vim.git'
Plugin 'peitalin/vim-jsx-typescript'


" plugin from http://vim-scripts.org/vim/scripts.html --- Plugin 'L9'
" Git plugin not hosted on GitHub --- Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine --- Plugin 'file:///home/gmarik/path/to/plugin'
" -----------------------------

call vundle#end()            " required
filetype plugin indent on    " required
filetype indent on
syntax enable

" ---- CUSTOM SETTINGS -------
"colorscheme molokai
"----------------

" tagbar
map <F6> :TagbarToggle <CR>

map <F5> :NERDTreeToggle <CR>
let g:NERDTreeWinSize=40
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

" open Nerd Tree when there was no file on the command line:
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()

map <c-p> :CtrlP <CR>
let g:ctrlp_custom_ignore = 'coverage\|dist\|dist-*\|node_modules\|DS_Store\|git'
" open ctrl p file in new buffer
let g:ctrlp_switch_buffer = 0
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-v>', '<2-LeftMouse>'],
    \ 'AcceptSelection("v")': ['<cr>', '<RightMouse>'],
    \ }

set number
set showcmd
set cursorline
set wildmenu
set showmatch
set hlsearch
set incsearch
" move vertically by visual line:
nnoremap j gj
nnoremap k gk
" set paste
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd BufWritePre *.js %s/\s\+$//e

Automatically insert a matching brace in Vim
inoremap { {}<ESC>ha
inoremap ( ()<ESC>ha
inoremap " ""<ESC>ha
inoremap ' ''<ESC>ha

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"for cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


" easy motion, case insensitive
let g:EasyMotion_smartcase = 1

" ctrl w + o makes it full screen
nnoremap <silent> <C-w>w :ZoomWin<CR>

" linting / auto format on save
let g:ale_sign_error = '?'
let g:ale_sign_warning = '?'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_fix_on_save = 1
let g:ale_linters = {
\'javascript': ['flow', 'eslint'],
\}
let g:ale_fixers = {
\'javascript': ['eslint'],
\}

"So I can move around in insert
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

