"---------------------------BEGIN PLUG----------------------------

call plug#begin()

Plug 'honza/vim-snippets'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'valloric/youcompleteme'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ternjs/tern_for_vim'

call plug#end()

"---------------------------END PLUG--------------------------------

" Nerd tree
map <C-b> :NERDTreeToggle<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nmap <F8> :TagbarToggle<CR>
" Automatic start nerd tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Syntastic
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" YouCompleteMe
let g:ycm_clangd_uses_ycmd_caching = 0 " Let clangd fully control code completion
let g:ycm_clangd_binary_path = exepath("clangd") " Use installed clangd, not YCM-bundled clangd which doesn't get updates.i
set completeopt-=preview " Disable preview windows

" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
let g:ctrlp_custom_ignore = {
    \ 'dir': '',
    \ 'file': '\v\.(exe|swp)$',
    \ 'link': '',
    \ }
let g:ctrlp_working_path_mode = 0

" Onedark theme
syntax on
colorscheme onedark
let g:onedark_termcolors=256

" Airline
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1

" IndentLine
let g:indentLine_char = '┆'  " '|', '¦', '┆', '┊'
let g:indentLine_color_term = 237

" vim snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" User setting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80
set autoread
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
highlight ColorColumn ctermbg=0 guibg=lightgrey

function! JAVASET()
    nnoremap <buffer> <F9> :w<cr>:!javac %<cr>:!java %< <cr>
endfunction

function! CSET()
    nnoremap <buffer> <F9> :w<cr>:!gcc % -o %< <cr>:!./%< <cr>
endfunction

function! CPPSET()
    nnoremap <buffer> <F9> :w<cr>:!g++ % -o %< <cr>:!./%< <cr>
endfunction

autocmd FileType c          call CSET()
autocmd FileType cpp        call CPPSET()
autocmd FileType java       call JAVASET()
