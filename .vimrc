" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

set noundofile
set nobackup

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif     
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

 
:set nu
:set relativenumber
:set ts=2
:set shiftwidth=2
:set expandtab
:set autoindent
:set hlsearch
:set guioptions-=m
" :set cursorline
" :set cursorcolumn
" :set cursorline

nnoremap <c-j> <c-d>
nnoremap <c-k> <c-u>
nnoremap <A-j> <c-d>
nnoremap <A-k> <c-u>
nnoremap <c-h> <c-y>
nnoremap <c-l> <c-e>
nnoremap <A-l> <c-w>l
nnoremap <A-h> <c-w>h
nnoremap <A-j> <c-w>j
nnoremap <A-k> <c-w>k
" nnoremap <C-n> :bn<CR>
" nnoremap <C-m> :bp<CR>
nnoremap <C-n> gt
nnoremap <C-m> gT


" leader --- <Space>
let mapleader = "\<Space>"
nnoremap <leader>q :q<CR>
nnoremap <leader>s :w<CR>


inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

autocmd InsertEnter *se cul
" hi CursorLine term=bold cterm=bold ctermbg=Red
:set nu
:set nu
highlight Normal guibg=grey90
highlight Cursor guibg=Green guifg=NONE
highlight lCursor guibg=Cyan guifg=NONE
highlight NonText guibg=grey80
highlight Constant gui=NONE guibg=grey95
highlight Special gui=NONE guibg=grey95
