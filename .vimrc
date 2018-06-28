""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Packages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Autoinstall vim-plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}

call plug#begin('~/.vim/plugged')



" Autocomplete and syntax
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'ternjs/tern_for_vim', {'for': 'javascript'}
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'octol/vim-cpp-enhanced-highlight'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {{{
  nnoremap <C-p> :FZF <cr>
  nnoremap <A-p> :F <cr>
" }}}

" Moving around easily
Plug 'easymotion/vim-easymotion'
Plug 'raimondi/delimitmate'

" Filetree
Plug 'scrooloose/nerdtree'

" Commenter
Plug 'scrooloose/nerdcommenter'


" Nice status bar at the bottom
Plug 'vim-airline/vim-airline'


call plug#end()

filetype on
filetype indent on
filetype plugin on
syntax on

set t_Co=256
set background=dark
colorscheme tomorrow-night-eighties
hi Normal guibg=NONE ctermbg=NONE
highlight LineNr ctermfg=grey
set number

set autoread
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set fileformats=unix,dos

set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set hlsearch
set showmatch
set cursorline
set relativenumber

set t_Co=256


" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

map <leader><leader>w <Plug>(easymotion-bd-w)
map <leader><leader>e <Plug>(easymotion-bd-e)
map <leader><leader>l <Plug>(easymotion-bd-jk)

" Fast saving
nmap <leader>w :w!<cr>

" YCM for C like language
nnoremap <C-[> :YcmCompleter GoToDeclaration<CR>
nnoremap <A-[> :YcmCompleter GoToDefinition<CR>

" Javascript

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_global_ycm_extra_conf = '' 

let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_seed_identifiers_with_syntax = 1

let g:ycm_autoclose_preview_window_after_completion = 0

let g:ycm_confirm_extra_conf = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)


let g:cpp_concepts_highlight = 1
let g:cpp_simple_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

function! FormatJSON()
    :%python -m json.tool
endfunction
