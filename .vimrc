""""""""""""""
"pathogen setup
""""""""""""""
syntax on
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
"vim addon

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"

"Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'noahfrederick/Hemisu' 
Bundle 'nanotech/jellybeans.vim'
Bundle 'spwhitt/Smyck-Color-Scheme'
Bundle 'amdt/sunset' 

"Syntax
Bundle 'tpope/vim-haml'
"Bundle 'cakebaker/scss-syntax.vim'
Bundle 'tpope/vim-markdown'
"Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'

"interface
Bundle 'Lokaltog/vim-powerline'
"Bundle 'spolu/dwm.vim'

"Search
Bundle 'kien/ctrlp.vim'

"tab
"Bundle 'ervandew/supertab'
Bundle 'garbas/vim-snipmate'

Bundle 'nathanaelkane/vim-indent-guides'

Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-surround'


filetype on
filetype plugin indent on

"basic setup
"""""""""""""
"set to vim not vi
set wrap
set linebreak
set number
set ruler
set t_Co=256

set ttymouse=xterm2
set mouse=n

"said to help with osx clipboard fun stuff
if $TMUX == ''
  set clipboard+=unnamed
endif

"""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""

" OS picking
"""""""""""""""""
if has('macunix')
  set guifont=DejaVu\ Sans\ Mono:h18
elseif has('unix')
  set guifont=DejaVu\ Sans\ Mono:h18
elseif has('win32')
  set guifont=Courier\ New:h18
endif

"colorscheme smyck
colorscheme jellybeans
colorscheme hemisu 
"" Solarize
"""""""""""""""
"let g:solarized_termcolors=256
"colorscheme solarized
"set background=light
""call togglebg#map("") 
"
"if has('gui_running')
"    set guioptions=egmrt
""else
""    set background=dark
"endif


"snipMate setup because of pathegen
""""""""""""""
let g:snippets_dir = "~/.vim/bundle/snippets/snippets/"
"let g:snippets_dir = "~/.vim/snippets"


""""""""""""""
"Powerline
""""""""""""""
set laststatus=2   " Always show the statusline
"let g:Powerline_symbols = 'unicode'
"let Powerline_symbols = 'unicode'

"""""""""""""""""
"side boarders
"""""""""""""""""
set foldcolumn=0

"if exists('+colorcolumn')
"  set colorcolumn=80
"else
"  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

"""""""""""""""""
" Saving stuff
"""""""""""""""""

"set lang
try
    lang en_US
catch
endtry

"Default file types
set ffs=unix,dos,mac

" Set encoding
set encoding=utf-8

""""""""""""""
" Whitespace
""""""""""""""

set list listchars=tab:\ \ ,trail:·
"recommend by drupal.org
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
"set display+=lastline

""""""""""""""""""
" Searching
"""""""""""""""""""
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <F3> :set hlsearch!<CR>

"""""""""""""""""
" Tab completion
"""""""""""""""""
"set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,.DS_Store,*/.sass-cache/*,.swp,

"" Disable Arrows
"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>

"""""""""""""""""""""""""""""""""""""""""
" Drupal module/etc syntax highlighting
"""""""""""""""""""""""""""""""""""""""""

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif


au BufRead,BufNewFile *.scss set filetype=scss

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

"ctrlP
"
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.sass-cache$\'

"" NeocompleCache
"""""""""""""""""
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_at_startup = 1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
"
"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"    \ }
"
"" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
"  let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
"" SuperTab like snippets behavior.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>"
"
"" Plugin key-mappings.
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()
"        
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
""autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

""""""""""""
"short cuts
""""""""""""

"ab rwhites %s/\s\+$//e

"""""""""""""""""
"markdown convert
"""""""""""""""""

ab m2h :%! /usr/local/bin/Markdown.pl --html4tags <cr>

let g:sunset_latitude = 40.1 
let g:sunset_longitude = 75.1 
let g:sunset_utc_offset = -5
""reload vimrc
"augroup myvimrc
"    au!
"    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
"augroup END

set nolist
