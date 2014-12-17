set nocompatible
" behave mswin

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/localvimrc'
Plugin 'kien/ctrlp.vim'
Plugin 'croaker/mustang-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-scala'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'leafgarland/typescript-vim'

filetype on
set encoding=utf-8
set fileencodings=utf-8,cp949,euc-kr,ucs-bom,latin1
language messages en_US.utf-8

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

syntax enable
syntax on

set guifont=DejaVuSansNanumGothic:h10:cHANGEUL
set backspace=indent,eol,start
set hidden
set wrap
set ts=4
set sw=4
set et
set smartcase
set smarttab
set incsearch
set hlsearch
set showmatch
set number
set ai
set ci
set title
set nobackup
set noswapfile
set ruler
set wildmode=list:longest,full

set fdm=marker

if has('mouse')
	set mouse=a
endif

color mustang
set background=dark
set t_ut=

au BufRead,BufNewFile *.eruby set ft=eruby
au BufRead,BufNewFile *.gradle set ft=groovy

augroup being_filetypes
	au!
	au FileType ruby,eruby,yaml,jade,javascript,scala setlocal et sw=2 ts=2
	au FileType typescript setlocal et sw=4 ts=4
augroup END

" Start NERDTree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Close NERDTree if the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeQuitOnOpen = 1

let g:EasyMotion_do_mapping = 0
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <Leader> <Plug>(easymotion-prefix)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
let g:localvimrc_name='.local_vimrc'
let g:localvimrc_sandbox=0
