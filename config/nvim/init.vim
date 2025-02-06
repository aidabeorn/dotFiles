" -*- mode: vimrc -*-
"vim: ft=vim

" le plugins https://github.com/junegunn/vim-plug
" http://patrickmarchand.com/posts/neovim-tuto.html
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc.vim'

Plug 'tpope/vim-sensible'
Plug 'benekastah/neomake'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'

Plug 'altercation/vim-colors-solarized'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" UltiSnips + Snippets
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" NERDtree + git plugin
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTree'] } | Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-scripts/cream-showinvisibles'

Plug 'jwalton512/vim-blade'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


Plug 'mhinz/vim-startify'

call plug#end()

let mapleader=","

if !exists('g:sp_airline_disable_powerline_fonts') || g:sp_airline_disable_powerline_fonts == 0
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_powerline_fonts = 1
  let g:airline_symbols.space = "\ua0"
endif
let g:airline_theme='murmur'

set background=dark
colorscheme catppuccin

set nomodeline
set cursorcolumn
set cursorline
set backspace=indent,eol,start
set tabstop=4
set complete-=i
set smarttab
set shiftwidth=4
set expandtab
set showbreak=+++\
set ss=1
set siso=9
set scrolloff=4
set previewheight=7
set splitbelow
set splitright
if !has('nvim')
  set encoding=utf-8
endif

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
