"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Packages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Color plugin
Plugin 'arcticicestudio/nord-vim'
Plugin 'haishanh/night-owl.vim'

" Autocomplete and syntax
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plugin 'octol/vim-cpp-enhanced-highlight'

" Fuzzy finder
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
" {{{
  nnoremap <C-p> :FZF <cr>
  nnoremap <A-p> :F <cr>
" }}}

" Moving around easily
Plugin 'easymotion/vim-easymotion'
Plugin 'raimondi/delimitmate'

" Filetree
Plugin 'scrooloose/nerdtree'

" Commenter
Plugin 'scrooloose/nerdcommenter'

" Nice status bar at the bottom
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme = 'nord'


call vundle#end()

filetype on
filetype indent on
filetype plugin on
syntax on

" Colors
syntax enable
set background=dark
set t_Co=16
colorscheme night-owl
set termguicolors
hi Normal guibg=NONE ctermbg=NONE


let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
let g:nord_comment_brightness = 20
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1

" enable line numbers
set number

set autoread
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set fileformats=unix,dos

" stop line breaking
set nowrap

" spaces not tabs
set tabstop=2
set shiftwidth=2
set expandtab

" split and navigation settings
set splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set smartindent
set autoindent
set hlsearch
set showmatch
set cursorline

" latex
let g:tex_flavor='latex'

" hybrid relativenumber
set relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

map <leader><leader>w <Plug>(easymotion-bd-w)
map <leader><leader>e <Plug>(easymotion-bd-e)

" Fast saving
nmap <leader>w :w!<cr>

" YCM for C like language
nnoremap <C-]> :YcmCompleter GoToDeclaration<CR>
nnoremap <A-]> :YcmCompleter GoToDefinition<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_global_ycm_extra_conf = '' 

let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_seed_identifiers_with_syntax = 1

let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_confirm_extra_conf = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C++ settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_concepts_highlight = 1
let g:cpp_simple_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!latex --pdf --warn all %<CR>

" View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>


set autoindent
hi Normal guibg=NONE ctermbg=NONE
set colorcolumn=100
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
