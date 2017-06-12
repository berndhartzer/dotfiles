set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

Plugin 'scrooloose/nerdtree'                    " Tree file explorer
" Plugin 'scrooloose/nerdcommenter'               " Powerful commenting
Plugin 'tpope/vim-commentary'                   " Simple commenting
Plugin 'jiangmiao/auto-pairs'                   " Auto bracket or parens closing
Plugin 'roman/golden-ratio'                     " Auto window sizing
Plugin 'itchyny/lightline.vim'                  " Statusline
" Plugin 'gregsexton/MatchTag'                  " Highlight matching html tags
Plugin 'alvan/vim-closetag'                     " Auto close html tags

Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" When all else fails; :VundleInstall
" When all all else fails; change name of .vim, e.g. mv .vim .vim2, then try
" launch vim, then change .vim back, relaunch vim and install plugins

set t_Co=256                                    " Enable 256 colour mode
syntax enable                                   " Syntax highlighting
set ignorecase                                  " Make searches case insensitive
set smartcase                                   " Searches only case sensitive when there is a capital letter
set nowrap                                      " No word wrapping at end of line

colorscheme solarized                           " Set colorscheme 

set colorcolumn=80                              " 80 character column marker
highlight ColorColumn ctermbg=Black             " Set column marker colour
set cursorline                                  " Set highlighting of cursor line
highlight CursorLine ctermbg=Black              " Set colouring of cursor line

set hlsearch                                    " Highlight search matches
set incsearch                                   " Incremental search; show search matches while typing
nmap <silent> ,/ :nohlsearch<CR>                " Clear search with ,/

set tabstop=8                                   " The width, in spaces, of a hard tabstop
set softtabstop=0                               " Turn off softtabstop
set expandtab                                   " Make the tab key insert spaces
set shiftwidth=2                                " The size of an indent, in spaces
set smarttab                                    " Make the tab key insert spaces or tabs to go to the next indent

set backspace=indent,eol,start                  " Make backspace behave 'normally'
set autoindent                                  " Auto indent on new line

set scrolloff=20                                " Determine number of lines to keep above and below cursor where possible

" set path+=**                                    " Allows searching down into subfolders
" set wildmenu                                    " Visual autocomplete for command menu

set visualbell                                  " Don't beep at me

set relativenumber                              " Hybrid numbering - show relative line numbers
set number                                      " Hybrid numbering - show cursor line number
" Show absolute numbers in insert mode
autocmd InsertEnter * :set number norelativenumber
" Show hybrid numbering in normal mode
autocmd InsertLeave * :set relativenumber number

" Open NERDTree automatically on vim startup if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeShowHidden=1                        " Show hidden files in NERDTree
let NERDTreeIgnore = ['\.swp$', '\.pyc$']       " NERDTree files to ignore
map <C-n> :NERDTreeToggle<CR>                   " Shortcut to toggle NERDTree with <C-n>

" filetype plugin on                              " Used for nerdcommenter
" let g:NERDSpaceDelims = 1                       " Add a space after comment delimiters by default

let g:closetag_filenames = "*.html,*.tpl"       " Auto close html tags in html and tpl files

nnoremap S diw"0P"                              " Stamp a word; replace the current word with the last yanked text

set laststatus=2                                " Always show the statusline
                                                      
" Configure lightline, including colorscheme and displaying relative paths
" let g:lightline = { 
"   \ 'colorscheme': 'jellybeans', 
"   \ 'component_function': { 
"     \ 'filename': 'LightLineRelativePath'
"   \ } 
" \ }
let g:lightline = { 'colorscheme': 'jellybeans', 'component_function': { 'filename': 'LightLineRelativePath' } }


" Function used by lightline to display relative path names for files
function! LightLineRelativePath()
  return expand('%')
endfunction

" From insert mode, skip to end of line with ii
" inoremap ii <C-o>$
" From insert mode, skip to end of line with <C-e>
" inoremap <C-e> <C-o>$

au BufNewFile,BufRead *.tpl :set filetype=php   " Use php syntax colouring for .tpl files
