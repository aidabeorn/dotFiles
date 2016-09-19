" -*- mode: vimrc -*-
"vim: ft=vim

" le plugins https://github.com/junegunn/vim-plug
" http://patrickmarchand.com/posts/neovim-tuto.html
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'

" Meow 
Plug 'elixir-lang/vim-elixir'

" Typescript
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'leafgarland/typescript-vim'

Plug 'altercation/vim-colors-solarized'

" UltiSnips + Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" NERDtree + git plugin
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTree'] } | Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-scripts/cream-showinvisibles'

Plug 'jwalton512/vim-blade'

Plug 'vim-airline/vim-airline'

Plug 'mhinz/vim-startify'

Plug 'thorerik/vim-mutt-helper'

call plug#end()

let g:deoplete#enable_at_startup=1
let mapleader=","

if !exists('g:sp_airline_disable_powerline_fonts') || g:sp_airline_disable_powerline_fonts == 0                                                                                                     
  if !exists('g:airline_symbols')                                                                                                                                                                   
    let g:airline_symbols = {}                                                                                                                                                                      
  endif                                                                                                                                                                                             
  let g:airline_powerline_fonts = 1                                                                                                                                                                 
  let g:airline_symbols.space = "\ua0"                                                                                                                                                              
endif

set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 256
colorscheme solarized

set nomodeline
set cursorcolumn
set cursorline
set backspace=eol,indent,start
set tabstop=4
set showbreak=+++\
set ss=1
set siso=9
set scrolloff=4
set previewheight=7
set splitbelow
set splitright
set encoding=utf-8

""""" SNIPPETS """"""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
""""" END SNIPPETS """""

let g:creamInvisibleShortCut = "<F5>" "for my F4 goto next error
""""" KEYBOARD MAPINGS """""
nnoremap <Leader>s <C-W><C-J>
nnoremap <Leader>w <C-W><C-K>
nnoremap <Leader>d <C-W><C-L>
nnoremap <Leader>a <C-W><C-H>
nnoremap <Leader>q :q<CR>

map <Leader>. :vsp<CR>
map <Leader>- :sp<CR>
map <F3> :source ~/.config/nvim/init.vim<CR>
map <F2> :NERDTreeToggle<CR>
""""" END KEYBOARD MAPINGS """""

""""" AUTO COMMANDS """""
" NERDTree
" Auto open on vim start
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Neomake
autocmd! BufWritePost * Neomake
""""" END AUTO COMMANDS """""

" Programming helps
ia #i #include
ia #d #define
ia @p @param
ia @r @return
ia @t @throws
ia @s @see
ia @l @link

" TODO markers
ia t: TODO:
ia T: TODO:
ia //t: // TODO:
ia //T: // TODO:
ia /*t: /* TODO:
ia /*T: /* TODO:
ia "t: " TODO:
ia "T: " TODO:
ia %t: % TODO:
ia %T: % TODO:
ia #t: # TODO:
ia #T: # TODO:

" FIXME markers (I use these to mark temporary code)
ia f: FIXME:
ia F: FIXME:
ia //f: // FIXME:
ia //F: // FIXME:
ia /*f: /* FIXME:
ia /*F: /* FIXME:
ia "f: " FIXME:
ia "F: " FIXME:
ia %f: % FIXME:
ia %F: % FIXME:
ia #f: # FIXME:
ia #F: # FIXME:
