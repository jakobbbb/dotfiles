""""""""""""""
"" PATHOGEN ""
""""""""""""""
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()


""""""""""""""""""""""
"" GENERAL SETTINGS ""
""""""""""""""""""""""

filetype plugin indent on
set textwidth=0 " (default) no breaking up of inserted text
set formatoptions+=t " automatic formatting
set fileformat=unix 
set cursorline " highlight line of cursor

set t_Co=256 "more colors

"colorscheme lucius " theme (in .vim/colors)
colorscheme jakob " theme (in .vim/colors)
set bg=dark
"let g:lucius_no_term_bg=1

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

set list " show spaces with underscores
set lcs=tab:▸\ ,trail:_

" create undofiles in ~/.undodir (less clutter)
" (and create undodir first if needed)
if !isdirectory($HOME."/.undodir")
    call mkdir($HOME."/.undodir", "", 0700)
endif
set undodir=~/.undodir
set undofile


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

inoremap <F12> <Esc>
inoremap jk <Esc>

"nmap <Leader>e :NERDTreeToggle<CR>

"F3 for paste
set pt=<F3>

"command W w
"command Q q

"nnoremap <C-Up> :call AdjustFontSize(1)<CR>:echo &guifont<CR>
"nnoremap <C-Down> :call AdjustFontSize(-1)<CR>:echo &guifont<CR>

"nnoremap <leader>w <C-w>v<C-w>l


" scroll for f<char> using , and . 
" next to eachother on german keyboard
nnoremap . ;

" turn off search by pressing enter
nnoremap <CR> :nohlsearch<CR><CR>

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
    autocmd FileType css setlocal ts=2 sw=2 et omnifunc=csscomplete#CompleteCSS
    autocmd FileType scss setlocal ts=2 sw=2 et omnifunc=csscomplete#CompleteCSS
    autocmd FileType javascript setlocal ts=2 sw=2 et
    autocmd FileType c setlocal ts=4 sw=4 noet
    autocmd FileType ada setlocal ts=3 sw=3 et
    autocmd FileType tex setlocal ts=2 sw=2 et
    autocmd FileType python setlocal ts=4 sw=4 et
endif


"""""""""""""
"" PLUGINS ""
"""""""""""""

" CtrlP
nnoremap <Leader>e :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRUFiles<CR>
nnoremap <Leader>c :CtrlP %:h<CR>
"let g:ctrlp_match_window = 'max:50,results:50'
let g:ctrlp_reuse_window = 'help'

let g:netrw_list_hide='\.swp$,\.o$,\.ali$,\.swo$,\.pyc$'


" Why doest thou not commit posterior to 20 verses?
let g:YUNOcommit_after = 20


let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'


"airline
set laststatus=2
set showmode " show current mode
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"let g:airline#extensions#syntastic#enabled = 1
let g:airline_detect_paste=1
let g:airline_symbols.readonly = ''
let g:airline_section_z = '%3l,%-3c %P'


"nerdtree
let NERDTreeIgnore=['\.swp$', '\.o$', '\.ali$', '\.swo$', '\*$']
let NERDTreeMouseMode=2
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "close NT if last window


"taglist
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1
nnoremap <Leader>t :TlistToggle<CR>


"""""""""""""""
"" FUNCTIONS ""
"""""""""""""""

function! AdjustFontSize(amount)
  let &guifont=substitute(&guifont,'\zs\d\+','\=eval(submatch(0)+a:amount)','')
endfunction
