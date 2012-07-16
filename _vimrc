set nocompatible
behave mswin

call pathogen#infect()

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

au BufRead,BufNewFile *.eruby set ft=eruby

augroup being_filetypes
	au!
	au FileType ruby,eruby,yaml,jade,javascript setlocal et sw=2 ts=2
augroup END

let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
