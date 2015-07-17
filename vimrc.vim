" if has("python")
" python << ENDPYTHON
" import sys
" sys.path = [
"     '', 
"     '/usr/local/bin', 
"     '/usr/local/Cellar/python/2.7.5/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/pip-1.4.1-py2.7.egg', 
"     '/Users/jesse/houzz/c2/python', 
"     '/usr/local/Cellar/python/2.7.5/Frameworks/Python.framework/Versions/2.7/lib/python27.zip', 
"     '/usr/local/Cellar/python/2.7.5/Frameworks/Python.framework/Versions/2.7/lib/python2.7', 
"     '/usr/local/Cellar/python/2.7.5/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-darwin', 
"     '/usr/local/Cellar/python/2.7.5/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-mac',
"     '/usr/local/Cellar/python/2.7.5/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-mac/lib-scriptpackages',
"     '/usr/local/Cellar/python/2.7.5/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-tk',
"     '/usr/local/Cellar/python/2.7.5/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-old',
"     '/usr/local/Cellar/python/2.7.5/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-dynload', 
"     '/usr/local/Cellar/python/2.7.5/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/PIL',
"     '/usr/local/Cellar/python/2.7.5/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/setuptools-1.0-py2.7.egg',
"     '/Library/Python/2.7/site-packages', 
"     '/usr/local/lib/python2.7/site-packages',
"     '/usr/local/lib/python2.7/site-packages/IPython/extensions'
"  ]
" import site
" ENDPYTHON
" endif

execute pathogen#infect()
set nocompatible

set number

set tabstop=4

set expandtab
set shiftwidth=4

filetype plugin on

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

Plugin 'Valloric/YouCompleteMe'

Plugin 'git@github.com:nvie/vim-flake8.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on
syntax on


autocmd FileType php set tabstop=4|set shiftwidth=4|set expandtab!

"autocmd FileType python compiler pylint
"autocmd FileType javascript call JavaScriptFold()
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufWritePost *.py call Flake8()

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
"colorscheme koehler
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
colorscheme solarized
set background=dark
set noshowmode
set encoding=utf-8
set term=xterm-256color

set hlsearch

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>

""""""""""""""""""""""""""""""""
" vim-flake8
"""""""""""""""""""""""""""""""
let g:flake8_show_in_file = 1
let g:flake8_show_in_gutter = 1
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg

"""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""
"let g:ycm_min_num_of_chars_for_completion = 99 
"let g:ycm_auto_trigger = 1



"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  let eq = ''
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      let cmd = '""' . $VIMRUNTIME . '\diff"'
"      let eq = '"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction

"""""""""""""""""""""""""""""
" jedi & pylint
""""""""""""""""""""""""""""
let g:pylint_onwrite = 0 
let g:pylint_show_rate = 0

"let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "bottom"
set splitbelow
autocmd FileType python setlocal completeopt
"-=preview

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""

set noruler
set laststatus=2
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
"let g:airline_enable_branch     = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline_enable_syntastic  = 1
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tagbar#enabled = 1

  " ---------------------------------------------------------------------------
  "
  "  Status Line
  "  "
  "  ---------------------------------------------------------------------------
  "
  
"set noruler
"set laststatus=2
"" path
"set statusline=%f
"" flags
"set statusline+=%m%r%h%w
"" git branch
""set statusline+=\ %{fugitive#statusline()}
"" encoding
"set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}]
"" rvm
""set statusline+=\ %{rvm#statusline()}
"" line x of y
"set statusline+=\ [line\ %l\/%L]
"
"" Colour
"hi StatusLine ctermfg=Black ctermbg=White
"
"" Change colour of statusline in insert mode
"au InsertEnter * hi StatusLine ctermbg=DarkBlue
"au InsertLeave * hi StatusLine ctermfg=Black ctermbg=White
  
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
let showmarks_enable = 1
" Show which marks
let showmarks_include ="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1 
hi ShowMarksHLl ctermfg=0 ctermbg=14 guifg=Black guibg=#8CCBEA  
hi ShowMarksHLu ctermfg=0 ctermbg=10 guifg=Black guibg=#A4E57E  
hi ShowMarksHLo ctermfg=0 ctermbg=11 guifg=Black guibg=#FFDB72  
hi ShowMarksHLm ctermfg=0 ctermbg=9 guifg=Black guibg=#FF7272   
hi ShowMarksHLla ctermfg=0 ctermbg=13 guifg=Black guibg=#FFB3FF

""""""""""""""""""""""""""""""
" markbrowser setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>mk :MarksBrowser<cr> 
