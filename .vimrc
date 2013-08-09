set nocompatible

set number

set tabstop=4

set expandtab
set shiftwidth=4
syntax on


autocmd FileType php set tabstop=4|set shiftwidth=4|set expandtab!

set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set encoding=prc
set completeopt=longest,menu 
filetype plugin indent on

set ignorecase
set smartcase
set incsearch

"colorscheme darkblue
colorscheme koehler

set hlsearch

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>


"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

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



""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber


""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout = "FileExplorer,BufExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr> 

""""""""""""""""""""""""""""""
" mark setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
vmap <silent> <leader>hh <Plug>MarkClear
nmap <silent> <leader>hr <Plug>MarkRegex
vmap <silent> <leader>hr <Plug>MarkRegex 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
"  set csprg=/usr/local/bin/cscope
"  set csto=1
"  set cst
"  set nocsverb
"  " add any database in current directory
"  if filereadable("cscope.out")
"    cs add cscope.out
"  endif
"  set csverb
  set cscopequickfix=s-,c-,d-,i-,t-,e-
endif

"nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""
" showmarks setting
""""""""""""""""""""""""""""""
" Enable ShowMarks
" let showmarks_enable = 1
" Show which marks
let showmarks_include ="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1 


""""""""""""""""""""""""""""""
" markbrowser setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>mk :MarksBrowser<cr> 
