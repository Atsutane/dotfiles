" Don't ensure compatibility with vi at all cost
set nocompatible
" More flexible backspace
set backspace=indent,eol,start
" Dark background
set bg=dark
set hlsearch
" Set the terminals title
set title
" Always show a status line
set laststatus=2
" Automatically indent, and do it smart
set autoindent smartindent
" Enhanced mode for command-line completion
set wildmenu
" Don't jump to the matching bracket automatically
set noshowmatch
" Enable ruler
set ruler
" Use UTF-8
set fileencoding=utf-8 encoding=utf-8
" Disable folding completely
set nofen
" Enable line numbers
" set nu
" Set the tabwidth
set ts=4
" Enable syntax highlighting
syntax on
" swap file directory
set directory=/tmp

" don't store .viminfo in $HOME
set viminfo+=n/tmp/.viminfo_atsu

" Highlighting for whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

highlight IdentTab ctermbg=blue guibg=blue
match IdentTab /^\t\+/
autocmd BufWinEnter * match IdentTab /^\t\+/
autocmd InsertEnter * match IdentTab /^\t\+\%#\@<!/
autocmd InsertLeave * match IdentTab /^\t\+/

autocmd BufWinLeave * call clearmatches()

