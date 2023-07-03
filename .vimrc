call plug#begin()                          " vim-plug begin

Plug 'jiangmiao/auto-pairs'                " Auto bracket or parens closing
Plug 'alvan/vim-closetag'                  " Auto close html tags
Plug 'tpope/vim-sleuth'                    " Auto detect and set indenting options
Plug 'tpope/vim-commentary'                " Code commenting
Plug 'tpope/vim-vinegar'                   " Improvements for netrw
Plug '~/.fzf'                              " FZF
Plug 'junegunn/fzf.vim'                    " Handy FZF vim wrapper
Plug 'knsh14/vim-github-link'              " GitHub links

Plug 'arcticicestudio/nord-vim'            " Nord colorscheme

call plug#end()                            " vim-plug end

syntax enable                              " Syntax highlighting
set nowrap                                 " No word wrapping at end of line
silent! colorscheme nord                   " Set colorscheme - don't prompt me on error

set colorcolumn=80,100,120                 " 80, 100 character column marker
highlight ColorColumn ctermbg=0            " Set column marker colour
set laststatus=2                           " Always show the statusline
highlight StatusLine ctermfg=7
set statusline+=\ %{FileRelativePath()}

set ignorecase                             " Make searches case insensitive
set smartcase                              " Searches only case sensitive when there is a capital letter
set hlsearch                               " Highlight search matches
set incsearch                              " Incremental search; show search matches while typing
" highlight Search    cterm=NONE ctermfg=white ctermbg=blue
highlight IncSearch cterm=NONE ctermfg=black ctermbg=yellow

set backspace=indent,eol,start             " Make backspace behave 'normally'
set autoindent                             " Auto indent on new line
set splitright                             " Open splits to the right

set scrolloff=20                           " Number of lines to keep above and below cursor where possible
set number                                 " Hybrid numbering - show cursor line number

let mapleader = "\<Space>"

" Clear search
nmap <silent> <leader>/ :nohlsearch<CR>

" fzf/ag
" add --hidden when calling ag to also search hidden/dot files
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--hidden', fzf#vim#with_preview(), <bang>0)

" fzf
nnoremap <leader>f :GFiles<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>: :History:<cr>
nnoremap <leader>ag :Ag<Space>
nnoremap <leader>gr :Ag<Space><C-r><C-w><cr>

let g:closetag_filenames = "*.html,*.tpl"  " Auto close html tags in html and tpl files

" Get the relative path of a file
function! FileRelativePath()
  return fnamemodify(expand("%"), ":~:.")
endfunction

augroup PHP
  autocmd!
  autocmd FileType php setlocal iskeyword-=$
augroup END

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

set belloff=all

" Window resizing. Window width should be 2/3 of the screen size, or at least
" 120 columns wide
function! s:ResizeWindows()
  let wmax = max([float2nr(&columns*0.66), 120])
  execute "set winwidth=".wmax
  " Make other windows sizes equal in remaining space
  wincmd =
endfunction

augroup ResizeWindowsAug
  autocmd!
  autocmd WinEnter * :call s:ResizeWindows()
augroup END

" jump to fn definition
nnoremap ]] :call search("^func")<cr>
nnoremap [[ :call search("^func", "b")<cr>
