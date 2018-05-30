call plug#begin()                          " vim-plug begin

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " Tree file explorer - load on demand
Plug 'jiangmiao/auto-pairs'                " Auto bracket or parens closing
Plug 'roman/golden-ratio'                  " Auto split sizing
Plug 'itchyny/lightline.vim'               " Statusline
" Plug 'gregsexton/MatchTag'                 " Highlight matching html tags
Plug 'alvan/vim-closetag'                  " Auto close html tags
Plug 'tpope/vim-sleuth'                    " Auto detect and set indenting options
" Plug 'joonty/vdebug'                       " Debugging
" Plug 'ctrlpvim/ctrlp.vim'                  " Fuzzy finder
Plug 'tpope/vim-commentary'                " Code commenting
Plug '~/.fzf'                              " FZF
Plug 'junegunn/fzf.vim'                    " Handy FZF vim wrapper

Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " TypeScript - load for typescript only
Plug 'pangloss/vim-javascript'             " JavaScript
Plug 'hhvm/vim-hack', { 'for': 'php' }     " Hack

Plug 'arcticicestudio/nord-vim'            " Nord colorscheme

call plug#end()                            " vim-plug end

syntax enable                              " Syntax highlighting
set nowrap                                 " No word wrapping at end of line
silent! colorscheme nord                   " Set colorscheme - don't prompt me on error

set regexpengine=1                         " Use old regex engine - faster

set colorcolumn=80                         " 80 character column marker
highlight ColorColumn ctermbg=0            " Set column marker colour
set cursorline                             " Set highlighting of cursor line
highlight CursorLine ctermbg=0             " Set colouring of cursor line
set laststatus=2                           " Always show the statusline

set ignorecase                             " Make searches case insensitive
set smartcase                              " Searches only case sensitive when there is a capital letter
set hlsearch                               " Highlight search matches
set incsearch                              " Incremental search; show search matches while typing
" Clear search with ,/
nmap <silent> ,/ :nohlsearch<CR>

set backspace=indent,eol,start             " Make backspace behave 'normally'
set autoindent                             " Auto indent on new line

set scrolloff=20                           " Determine number of lines to keep above and below cursor where possible
set relativenumber                         " Hybrid numbering - show relative line numbers
set number                                 " Hybrid numbering - show cursor line number
" Show absolute numbers in insert mode
autocmd InsertEnter * :set number norelativenumber
" Show hybrid numbering in normal mode
autocmd InsertLeave * :set relativenumber number

" Use php syntax colouring for .tpl files
au BufNewFile,BufRead *.tpl :set filetype=php

let NERDTreeShowHidden = 1                 " Show hidden files in NERDTree
let NERDTreeIgnore = ['\.swp$', '\.pyc$', '\.git$', '\.class$']  " NERDTree files to ignore
" Toggle NERDTree explorer with <C-n>
map <C-n> :NERDTreeToggle<CR>

let g:closetag_filenames = "*.html,*.tpl"  " Auto close html tags in html and tpl files
                                                      
" Configure lightline, including colorscheme and displaying relative paths
let g:lightline = { 'colorscheme': 'jellybeans', 'component_function': { 'filename': 'LightLineRelativePath' } }

" Function used by lightline to display relative path names for files
function! LightLineRelativePath()
  return expand('%')
endfunction

" Function used to trim whitespace while retaining view/searches
function! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfunction

" Command used to call the TrimWhitespace function
command! TrimWhitespace call TrimWhitespace()
