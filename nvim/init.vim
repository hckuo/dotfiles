" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {{{
    map <leader>f :Files<CR>
    map <leader>b :Buffer<CR>
    let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
    let g:fzf_layout = { 'down': '20%' }
    let g:fzf_buffers_jump = 1
" }}}
"

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'raimondi/delimitmate'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'
Plug 'vivien/vim-linux-coding-style'
" for heruristic indent
Plug 'tpope/vim-sleuth'
Plug 'rafi/awesome-vim-colorschemes'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#manual_complete()
"""""""""""""
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

let g:LanguageClient_useVirtualText = "No"
let g:LanguageClient_serverCommands = {
      \ 'c': ['ccls'],
      \ 'python': ['pyls'],
      \ 'rust': ['rls'],
      \ 'tex': ['texlab'],
      \ }
  " note that if you are using Plug mapping you should not use `noremap` mappings.
  nmap <F5> <Plug>(lcn-menu)
  nmap <C-\>g <Plug>(lcn-definition)
  nmap <C-]> <Plug>(lcn-definition)
  nmap <C-\>c <Plug>(lcn-references)
  let g:LanguageClient_diagnosticsList = 'Disabled'
  let g:LanguageClient_loggingLevel = 'INFO'

call plug#end()
colorscheme gruvbox

let g:c_syntax_for_h = 1
set colorcolumn=81

autocmd FileType plaintex,tex,latex,text call EnableSpellCheck()
" functions
function EnableSpellCheck()
    syntax spell toplevel
    set spell spelllang=en_us
    highlight SpellBad cterm=underline
endfunction
