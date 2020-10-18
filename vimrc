"
" for Vundle
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" Vundle Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
"                     :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"                     auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"
" for personal settings
"

" always show status line
set laststatus=2
" always show tabline
set showtabline=2
" always show line number
set number
" always show cursor line
set cursorline
" start syntax highlighting
syntax on
" tab/indent settings
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
" settings for search
set hlsearch
set ignorecase
set incsearch
set smartcase
" settings for yank to clipboard
set clipboard+=unnamed
set clipboard+=autoselect
" make backspace work like most other programs
set backspace=2
" command-line completion operates in an enhanced mode
set wildmenu
" wrap text at column 80
set formatoptions+=mM
set textwidth=79
" set colorscheme
set background=dark
colorscheme gruvbox

