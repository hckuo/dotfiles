" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/ctags.vim'
Plug 'majutsushi/tagbar'
Plug 'raimondi/delimitmate'
Plug 'airblade/vim-gitgutter'
Plug 'nlknguyen/c-syntax.vim'
Plug 'kassio/neoterm'
Plug 'ntpeters/vim-better-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'w0rp/ale'
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
call plug#end()

let mapleader                   = "\<space>"
let g:config_path               = $HOME."/.config/nvim/init.vim"
let g:ctrlp_map                 = '<C-F>'
let g:ctrlp_cmd                 = 'CtrlPBuffer'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_relative       = 1
let g:ctrlp_max_depth           = 40
let g:ctrlp_max_files           = 0
let g:NERDSpaceDelims           = 1
let g:NERDCompactSexyComs       = 1
let g:NERDToggleCheckAllLines   = 1


command! EditConfig execute 'edit' g:config_path
command! InstallPlugin execute 'source' g:config_path | PlugInstall

" Esc to exit emulated term
tnoremap <Esc> <C-\><C-n>

" Toggle-related mapping
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>tn :set invnumber<CR>

" Buffer-related mapping
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader><tab> :bprevious<CR>
nnoremap <leader>bl :ls<CR>
nnoremap <leader>bd :bdelete<CR>
"create horizontal buffer"
nnoremap <leader>b" :new<CR>
"create vertical buffer"
nnoremap <leader>b% :vnew<CR>

" File-related mapping
nnoremap <leader>fs :w<CR>
nnoremap <leader>fq :q<CR>
nnoremap <leader>ff :CtrlPCurWD<CR>


xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

syntax on
filetype on
filetype indent on
set wildignore+=*.o
set autowriteall
set cursorline
set tabstop=4
set shiftwidth=4
set background=dark
set mouse=a
set timeoutlen=1500
set cc=80
set expandtab
set autoindent smartindent
autocmd Filetype c,cpp setlocal tabstop=8 noet shiftwidth=8
autocmd BufRead,BufNewFile *.h,*.c set filetype=c
