call plug#begin()                          " vim-plug begin

Plug 'jiangmiao/auto-pairs'                " Auto bracket or parens closing
" Plug 'roman/golden-ratio'                  " Auto split sizing
Plug 'berndhartzer/golden-ratio', { 'branch': 'no-horizontal-resize' }
Plug 'itchyny/lightline.vim'               " Statusline
Plug 'alvan/vim-closetag'                  " Auto close html tags
Plug 'tpope/vim-sleuth'                    " Auto detect and set indenting options
Plug 'tpope/vim-commentary'                " Code commenting
Plug 'tpope/vim-vinegar'                   " Improvements for netrw
Plug '~/.fzf'                              " FZF
Plug 'junegunn/fzf.vim'                    " Handy FZF vim wrapper
Plug 'w0rp/ale'                            " Async linting

Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " TypeScript - load for typescript only
Plug 'pangloss/vim-javascript'             " JavaScript
Plug 'mxw/vim-jsx'                         " JSX
Plug 'hhvm/vim-hack', { 'for': 'php' }     " Hack

Plug 'arcticicestudio/nord-vim'            " Nord colorscheme

" Plug '~/dev/golden-ratio'

call plug#end()                            " vim-plug end

syntax enable                              " Syntax highlighting
set nowrap                                 " No word wrapping at end of line
silent! colorscheme nord                   " Set colorscheme - don't prompt me on error

set regexpengine=1                         " Use old regex engine - faster

set colorcolumn=80,100                     " 80, 100 character column marker
highlight ColorColumn ctermbg=0            " Set column marker colour
set laststatus=2                           " Always show the statusline

set ignorecase                             " Make searches case insensitive
set smartcase                              " Searches only case sensitive when there is a capital letter
set hlsearch                               " Highlight search matches
set incsearch                              " Incremental search; show search matches while typing

set backspace=indent,eol,start             " Make backspace behave 'normally'
set autoindent                             " Auto indent on new line
set splitright                             " Open splits to the right

set scrolloff=20                           " Number of lines to keep above and below cursor where possible
set relativenumber                         " Hybrid numbering - show relative line numbers
set number                                 " Hybrid numbering - show cursor line number
" Show absolute numbers in insert mode
autocmd InsertEnter * :set number norelativenumber
" Show hybrid numbering in normal mode
autocmd InsertLeave * :set relativenumber number

" Clear search with ,/
nmap <silent> ,/ :nohlsearch<CR>

" FZF
nnoremap <leader>ff :GFiles<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>ag :Ag<cr>

let g:closetag_filenames = "*.html,*.tpl"  " Auto close html tags in html and tpl files

let g:golden_ratio_resize_horizontal = 0   " Quick fix for disabling golden-ratio horizontal resizing

" let g:ale_lint_on_text_changed = 'never'   " Ale Only lint on file save
let g:ale_set_signs = 0                    " Ale Dont show lint errors in gutter

" Configure lightline, including colorscheme and displaying relative paths
let g:lightline = { 'colorscheme': 'jellybeans', 'component_function': { 'filename': 'LightLineRelativePath' } }

" Use php syntax colouring for .tpl files
au BufNewFile,BufRead *.tpl :set filetype=php

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
