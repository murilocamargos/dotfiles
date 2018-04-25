" Vundle
if isdirectory(expand($HOME . '/.vim/bundle/Vundle.vim/'))
    filetype off
    set nocompatible
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
        Plugin 'VundleVim/Vundle.vim'
        " Plugins
        Plugin 'airblade/vim-gitgutter'
        Plugin 'bling/vim-airline'
        Plugin 'kien/ctrlp.vim'
        Plugin 'mattn/emmet-vim'
        Plugin 'plasticboy/vim-markdown'
        Plugin 'tpope/vim-eunuch'
        Plugin 'w0rp/ale'
        Plugin 'tmhedberg/SimpylFold'
        Plugin 'nvie/vim-flake8'
        Plugin 'scrooloose/nerdtree'
        " Themes
        Plugin 'altercation/vim-colors-solarized'
        Plugin 'vim-airline/vim-airline-themes'
    call vundle#end()
endif

" Disable mouse
set mouse=

" Disable backups
set nobackup
set noswapfile
set nowritebackup

"split navigations
set splitbelow
set splitright

set backspace=2 " make backspace work like most other programs

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" Disable viminfo
set viminfo=

" Replace tabs for spaces
set expandtab

" Indentation and syntax
filetype plugin indent on
set autoindent
syntax on

" Indentation settings per file type
au FileType ruby setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et
au FileType python setl sw=4 sts=4 et

" Viewing options, like cursor position and number of lines
set cursorline
set linebreak
set number
set ruler
set wildmenu

" Fix ESC delay
set ttimeoutlen=0

" Toggle hidden characters
map <silent> <C-m> :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Navigation between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Navigation between tabs
map <Tab> gt
map <S-Tab> gT

" Search options
set hlsearch
set ignorecase
set incsearch

" Clear search results highlights
nmap <silent> <C-C> :silent noh<CR>

" File encoding
set encoding=utf-8

" Omnicomplete
inoremap <Nul> <C-x><C-o>

" Close preview window automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Settings per plugin/theme
if isdirectory(expand($HOME . '/.vim/bundle/Vundle.vim/'))
    if isdirectory(expand($HOME . '/.vim/bundle/vim-colors-solarized/'))
        if has('gui_running')
            set background=light
        else
            set background=dark
        endif
        let g:solarized_termcolors=256
        set t_Co=256
        colorscheme solarized
        " Fix spell checker highlighting
        hi SpellBad cterm=underline
    endif

    if isdirectory(expand($HOME . '/.vim/bundle/ctrlp.vim/'))
        if executable('ag')
            let g:ctrlp_user_command = 'ag %s -g ""'
        endif
    endif
endif

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"ignore files in NERDTree
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|venv'
let NERDTreeIgnore=['\.pyc$', '\~$']
au VimEnter *  NERDTree
let NERDTreeShowHidden=1
