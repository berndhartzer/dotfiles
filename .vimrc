" Start Vundle
set nocompatible                           " be iMproved, required 
filetype off                               " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" Plugin 'scrooloose/nerdtree'               " Tree file explorer
" Plugin 'scrooloose/nerdcommenter'          " Powerful commenting
" Plugin 'tpope/vim-commentary'              " Simple commenting
Plugin 'jiangmiao/auto-pairs'              " Auto bracket or parens closing
Plugin 'roman/golden-ratio'                " Auto split sizing
Plugin 'itchyny/lightline.vim'             " Statusline
" Plugin 'gregsexton/MatchTag'               " Highlight matching html tags
Plugin 'alvan/vim-closetag'                " Auto close html tags
Plugin 'tpope/vim-sleuth'                  " Auto detect and set indenting options
" Plugin 'joonty/vdebug'                     " Debugging
Plugin 'ctrlpvim/ctrlp.vim'                " Fuzzy finder

Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'

Plugin 'arcticicestudio/nord-vim'

call vundle#end()                          " required
filetype plugin indent on                  " required
" End Vundle

syntax enable                              " Syntax highlighting
set nowrap                                 " No word wrapping at end of line

set ignorecase                             " Make searches case insensitive
set smartcase                              " Searches only case sensitive when there is a capital letter
set hlsearch                               " Highlight search matches
set incsearch                              " Incremental search; show search matches while typing
" Clear search with ,/
nmap <silent> ,/ :nohlsearch<CR>

colorscheme nord                           " Set colorscheme 

set colorcolumn=80                         " 80 character column marker
highlight ColorColumn ctermbg=0            " Set column marker colour
set cursorline                             " Set highlighting of cursor line
highlight CursorLine ctermbg=0             " Set colouring of cursor line

" set tabstop=8                              " The width, in spaces, of a hard tabstop
" set softtabstop=0                          " Turn off softtabstop
" set expandtab                              " Make the tab key insert spaces
" set shiftwidth=2                           " The size of an indent, in spaces
" set smarttab                               " Make the tab key insert spaces or tabs to go to the next indent

set backspace=indent,eol,start             " Make backspace behave 'normally'
set autoindent                             " Auto indent on new line

" set visualbell t_vb=                       " Don't beep or flash at me

set scrolloff=20                           " Determine number of lines to keep above and below cursor where possible
set relativenumber                         " Hybrid numbering - show relative line numbers
set number                                 " Hybrid numbering - show cursor line number
" Show absolute numbers in insert mode
autocmd InsertEnter * :set number norelativenumber
" Show hybrid numbering in normal mode
autocmd InsertLeave * :set relativenumber number

set laststatus=2                           " Always show the statusline

" Use php syntax colouring for .tpl files
au BufNewFile,BufRead *.tpl :set filetype=php

" Open NERDTree automatically on vim startup if no file is specified
" autocmd StdinReadPre * let s:std_in = 1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" let NERDTreeShowHidden = 1                 " Show hidden files in NERDTree
" let NERDTreeIgnore = ['\.swp$', '\.pyc$', '\.git$', '\.class$']  " NERDTree files to ignore
" Toggle NERDTree explorer with <C-n>
" map <C-n> :NERDTreeToggle<CR>

let g:closetag_filenames = "*.html,*.tpl"  " Auto close html tags in html and tpl files
                                                      
" Configure lightline, including colorscheme and displaying relative paths
let g:lightline = { 'colorscheme': 'jellybeans', 'component_function': { 'filename': 'LightLineRelativePath' } }

" Function used by lightline to display relative path names for files
function! LightLineRelativePath()
  return expand('%')
endfunction
