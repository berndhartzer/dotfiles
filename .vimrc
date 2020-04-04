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

Plug 'pangloss/vim-javascript'             " JavaScript
" Plug 'mxw/vim-jsx'                         " JSX
" Plug 'hhvm/vim-hack', { 'for': 'php' }     " Hack

Plug 'arcticicestudio/nord-vim'            " Nord colorscheme

" Plug '~/dev/golden-ratio'

call plug#end()                            " vim-plug end

syntax enable                              " Syntax highlighting
set nowrap                                 " No word wrapping at end of line
silent! colorscheme nord                   " Set colorscheme - don't prompt me on error

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
set number                                 " Hybrid numbering - show cursor line number

let mapleader = "\<Space>"

" Clear search
nmap <silent> <leader>/ :nohlsearch<CR>

" FZF
nnoremap <leader>f :GFiles<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>: :History:<cr>
nnoremap <leader>ag :Ag<Space>
nnoremap <leader>gr :Ag <C-r><C-w><cr>

let g:closetag_filenames = "*.html,*.tpl"  " Auto close html tags in html and tpl files

let g:golden_ratio_resize_horizontal = 0   " Quick fix for disabling golden-ratio horizontal resizing

" Configure lightline, including colorscheme and displaying relative paths
let g:lightline = { 'colorscheme': 'jellybeans', 'component_function': { 'filename': 'LightLineRelativePath' } }

" Function used by lightline to display relative path names for files
function! LightLineRelativePath()
  return expand('%')
endfunction

" Use php syntax colouring for .tpl files
au BufNewFile,BufRead *.tpl :set filetype=php

" Git blame
command! -nargs=* Blame call s:GitBlame()

function! s:GitBlame()
    let cmd = "git blame -w " . bufname("%")
    let nline = line(".")
    botright new
    execute "$read !" . cmd
    execute "1d"
    execute "normal " . nline . "gg"
    execute "set filetype=perl"
    execute "set buftype=nowrite"
endfunction

nnoremap <leader>gb :Blame<cr>
