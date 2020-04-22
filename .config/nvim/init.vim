""""""""""""""""""""""
"" GENERAL SETTINGS ""
""""""""""""""""""""""

filetype plugin indent on
set textwidth=0 " (default) no breaking up of inserted text
set formatoptions+=t " automatic formatting
set fileformat=unix
set cursorline " highlight line of cursor

set t_Co=256 "more colors

colorscheme jakob
set bg=dark
let g:lucius_no_term_bg=1

" set language to US (not needed in most cases, produces error in others)
" only enable if vim is german by default!
"language en_US

set history=1000 " remember a lot of 'i' commands

set bs=2 " make backspace working in vim 7.3

set shiftwidth=4 " four spaces for indenting
set encoding=utf-8
set tabstop=4 " tab equals 4 spaces
set expandtab " always use spaces
set ruler " show line and col (bottom)
set tm=500
syntax on
set number " line numbers
set autoindent
set smartindent
set scrolloff=5 " min no of lines above/below cursor

set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/ngerman
set spelllang=en,de

set list " show spaces with underscores
set lcs=tab:▸\ ,trail:_

" create undofiles in ~/.undodir (less clutter)
" (and create undodir first if needed)
if !isdirectory($HOME."/.undodir")
    call mkdir($HOME."/.undodir", "", 0700)
endif
set undodir=~/.undodir
set undofile

set cc=+1

let g:tex_flavor = "latex"

set guicursor= " no block cursor

set laststatus=2
set showmode

set inccommand=nosplit " `:s` live preview

"""""""""""""""
"" WILD MENU ""
"""""""""""""""

set wildmenu
set wildmode=longest:full " 'longest' will disable tab scrolling thingy
set wildignore=*.o,*.obj,*.exe,*~,*.swp,*.log,*.out
set wildcharm=<Tab>


"""""""""""""""""""""
"" SEARCH SETTINGS ""
"""""""""""""""""""""

set smartcase
set ignorecase
set incsearch
set hlsearch


"""""""""""""""""
"" KEYBINDINGS ""
"""""""""""""""""

inoremap jk <Esc>
set pt=<F3> "F3 for paste mode

command W w
command Q q

" scroll for f<char> using , and . 
" next to eachother on german keyboard
nnoremap . ;

" turn off search by pressing enter
nnoremap <CR> :nohlsearch<CR><CR>

" Delete up to email signature
nnoremap <silent> <leader>gr <Esc>d/^--\_.*Jakob<CR>:nohl<CR>O

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" disable scroll whell
noremap <ScrollWheelUp> <nop>
noremap <S-ScrollWheelUp> <nop>
noremap <C-ScrollWheelUp> <nop>
noremap <ScrollWheelDown> <nop>
noremap <S-ScrollWheelDown> <nop>
noremap <C-ScrollWheelDown> <nop>
noremap <ScrollWheelLeft> <nop>
noremap <S-ScrollWheelLeft> <nop>
noremap <C-ScrollWheelLeft> <nop>
noremap <ScrollWheelRight> <nop>
noremap <S-ScrollWheelRight> <nop>
noremap <C-ScrollWheelRight> <nop>


"""""""""""
"" RULES ""
"""""""""""

if has("autocmd")
    autocmd FileType make setlocal ts=8 sw=8 noet
    autocmd FileType html setlocal ts=2 sw=2 et omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css setlocal ts=2 sw=2 et tw=72 omnifunc=csscomplete#CompleteCSS
    autocmd FileType scss setlocal ts=2 sw=2 et tw=72 omnifunc=csscomplete#CompleteCSS
    autocmd FileType javascript setlocal ts=2 sw=2 tw=72 et
    autocmd FileType c setlocal ts=4 sw=4 et
    autocmd FileType ada setlocal ts=3 sw=3 et
    autocmd FileType tex setlocal ts=2 sw=2 tw=72 et
    autocmd FileType python setlocal ts=4 sw=4 et
    autocmd FileType markdown setlocal tw=72
endif


"""""""""""""""""""""""""""""""""
"" PLUGINS AND PLUGIN SETTINGS ""
"""""""""""""""""""""""""""""""""

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'dense-analysis/ale'
call plug#end()

""" FZF
nnoremap <silent> <leader>f :GFiles<CR>
nnoremap <silent> <leader>F :Files<CR>

""" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

""" ALE
nmap <silent> <C-a> <Plug>(ale_previous_wrap)
nmap <silent> <C-e> <Plug>(ale_next_wrap)

"""""""""""""""
"" FUNCTIONS ""
"""""""""""""""
