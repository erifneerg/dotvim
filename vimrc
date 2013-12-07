set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoNeoBundle manage NeoNeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

NeoBundle 'tpope/vim-sensible'

"Colors
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'slindberg/vim-colors-smyck'
NeoBundle 'Lokaltog/vim-distinguished'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'molok/vim-vombato-colorscheme'
NeoBundle 'Blueshift'
NeoBundle 'john2x/flatui.vim'
NeoBundle 'pyte'
""Syntax
NeoBundle 'tpope/vim-markdown'
"NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'cakebaker/scss-syntax.vim'
"NeoBundle 'tpope/vim-haml'

"interface
NeoBundle 'bling/vim-airline'
"NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'sjl/gundo.vim'
"NeoBundle 'Yggdroot/indentLine'

"Search
NeoBundle 'Shougo/unite.vim'

"Auto typing
NeoBundle 'tpope/vim-surround'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'honza/vim-snippets'
"NeoBundle 'SirVer/ultisnips'
"NeoBundle 'Valloric/YouCompleteMe'
"snippets
NeoBundle 'technosophos/drupal-snippets'
NeoBundle 'ronny/scss-snippets.vim'

"error checking
"NeoBundle 'scrooloose/syntastic'

"Movement
NeoBundle 'tpope/vim-unimpaired'
"Search
NeoBundle 'mileszs/ack.vim'
"Note taking
"NeoBundle 'xolox/vim-notes'
"NeoBundle 'xolox/vim-misc'

"vim addon
""""""""""
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'

"Git
"NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'tpope/vim-git'

filetype plugin indent on

let g:netrw_home=$HOME . '/.hide'

"mose movement test
set ttymouse=xterm2
set mouse=a

"basic setup
"""""""""""""
set wrap
set linebreak
set number
set relativenumber
set list
set hidden
set encoding=utf-8 
set undofile
set undodir=~/.vim/undo/
syntax sync minlines=200

" Saving stuff
""""""""""""""
set ffs=unix,dos,mac " Default file types
set noswapfile
"set lang
try
  lang en_US
catch
endtry

"Notes setup
""""""""""""
let g:notes_directories = ['~/Dropbox/nvAlt/']
let g:notes_suffix = '.txt'

"Break the habit
""""""""""""""""
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Colors and Fonts
""""""""""""""""""
colorscheme smyck
"colorscheme jellybeans 
"colorscheme vombato
"colorscheme monokai
"set g:solarized_termcolors=256
"set background=light
"colorscheme solarized
""Light colorscheme
"set background=light
"colorscheme flatui
"colorscheme blueshift
"colorscheme pyte

"AirLine 
"""""""""
"character of interest ▶ » « ◀

"let g:airline_fonts=1
"choices dark light badwolf ubaryd solarized powerlineish laederon
"let g:airline_theme=''
"let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'
"let g:airline_theme='solarized'
" remove unused modes
let g:airline_right_sep=''
let g:airline_left_sep = ''
"let g:airline_enable_syntastic=0
" set second section to filename
"let g:airline_section_b="%f"
" empty third and fourth sections
"let g:airline_section_c=""
"let g:airline_section_x=""
" put filetype in fifth section
"let g:airline_section_y="%Y"
let g:airline#extensions#whitespace#enabled = 0

"Current Line highlighting
""""""""""""""""""""""""""
"set cursorline
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

function! ToggleNuMode()
  if(&rnu == 1)
    set nu
  else
    set rnu
  endif
endfunc
nnoremap <Leader>n :call ToggleNuMode()<CR>

" Whitespace
""""""""""""
"set list listchars=tab:\ \ ,trail:·

"algin text
"""""""""""
nmap <Leader>x ggVG=``

" help with osx clipboard fun stuff
set clipboard+=unnamed

"recommend by drupal.org
set expandtab
set tabstop=2
set shiftwidth=2

set display+=lastline

" Drupal module/etc syntax highlighting
"""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif

" SASS and Compass setup
""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.scss syntax sync fromstart
"search clear
nnoremap <F3> :set hlsearch!<CR>

" delimitMate
"""""""""""""
"balanace 
let delimitMate_balance_matchpairs = 1
"expans with enter
let delimitMate_expand_cr = 1
au FileType mail let b:delimitMate_expand_cr = 1

" Unite
"""""""
"fuzzy clone
nnoremap <C-p> :Unite -start-insert file_rec -no-split<cr>
"list buffers
nnoremap <Leader>b :Unite buffer -no-split<cr>


" Neocomplete and snippet
"""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Enable omni completion.
autocmd FileType css,scss,sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^.  \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Return a corresponding paren to be sent to the buffer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CloseParen()
  let parenpairs = {'(' : ')',
        \  '[' : ']',
        \  '{' : '}'}

  let [m_lnum, m_col] = searchpairpos('[[({]', '', '[\])}]', 'nbW')

  if (m_lnum != 0) && (m_col != 0)
    let c = getline(m_lnum)[m_col - 1]
    return parenpairs[c]
  endif
  return ''
endfun
imap <C-e> <C-r>=CloseParen()<CR>
" For writing my words
""""""""""""""""""""""
func! WordProcessorMode()
  setlocal formatoptions=1
  setlocal noexpandtab
  map j gj
  map k gk
  setlocal spell spelllang=en_us
  set complete+=s
  set formatprg=par
  setlocal wrap
  setlocal linebreak
  TSB
endfu
com! WP call WordProcessorMode()


func! DevMode()
  unmap j
  unmap k
  set ruler
  set relativenumber
  TSB
endfu
com! DEV call DevMode()

"" Align all elements
func! Align()
  au gg

endfu
com! ALIGN call Align()

func! ToggleStatus()
  if (&laststatus == 0)
    set laststatus=2
  else
    set laststatus=0
  endif
  AirlineToggle
endfu
com! TSB call ToggleStatus()
"Removes Status Bar
"nmap <Leader>s :TSB<cr>

"reload vimrc
augroup vimrcs
  au!
  au bufwritepost ~/.vimrc
        \ source ~/.vimrc |
        \ if exists('g:Powerline_loaded') |
        \ silent! call Pl#Load() |
        \ endif
augroup END

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" Open current file in Marked
com! Marked !open -a "Marked" %

set nolist
