set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-sensible'

"Colors
Bundle 'nanotech/jellybeans.vim'
Bundle 'slindberg/vim-colors-smyck'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'sickill/vim-monokai'
Bundle 'molok/vim-vombato-colorscheme'
Bundle 'Blueshift'
Bundle 'pyte'
""Syntax
Bundle 'tpope/vim-markdown'
"Bundle 'plasticboy/vim-markdown'
"Bundle 'cakebaker/scss-syntax.vim'

"interface
Bundle 'bling/vim-airline'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'sjl/gundo.vim'

"Search
"Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/unite.vim'

"Auto typing
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'

Bundle 'Shougo/neocomplete'
Bundle 'Shougo/neosnippet'
Bundle 'honza/vim-snippets'
"Bundle 'SirVer/ultisnips'

"snippets
Bundle 'technosophos/drupal-snippets'
Bundle 'ronny/scss-snippets.vim'

"error checking
Bundle 'scrooloose/syntastic'

"Movement
Bundle 'tpope/vim-unimpaired'
"Search
Bundle 'mileszs/ack.vim'
"Note taking
"
Bundle 'xolox/vim-notes'
Bundle 'xolox/vim-misc'

"vim addon
""""""""""
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

"Git
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'

filetype plugin indent on

let g:netrw_home=$HOME . '/.hide'

"mose movement test
set ttymouse=xterm2
set mouse=a

"basic setup
"""""""""""""
set wrap
set linebreak
set t_Co=256
set relativenumber
set list
set hidden
set encoding=utf-8 

" Saving stuff
""""""""""""""
set ffs=unix,dos,mac " Default file types
set noswapfile
au FocusLost * :wa
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
"colorscheme twilight256
"colorscheme smyck
"colorscheme smyck256
"colorscheme jellybeans 
"colorscheme vombato
colorscheme monokai

""Light colorscheme
"set background=light
""colorscheme blueshift
"colorscheme pyte

"Powerline
"let g:Powerline_symbols = 'fancy'

"AirLine 
"""""""""
"character of interest ▶ » « ◀
let g:airline_left_sep = ''
let g:airline_right_sep=''
"let g:airline_fonts=1
"choices dark light badwolf ubaryd solarized powerlineish laederon
"let g:airline_theme=''
let g:airline_theme='powerlineish'
" remove unused modes
let g:airline_enable_fugitive=0
"let g:airline_enable_syntastic=0
" set second section to filename
"let g:airline_section_b="%f"
" empty third and fourth sections
"let g:airline_section_c=""
"let g:airline_section_x=""
" put filetype in fifth section
"let g:airline_section_y="%Y"

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

" help with osx clipboard fun stuff
"if has("unix")
"  let s:uname = system("uname")
"  if s:uname == "Darwin"
    set clipboard=unnamed
"  endif
"endif
    
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
autocmd BufNewFile,BufRead *.scss set ft=scss.css

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
  set norelativenumber
  map j gj
  map k gk
  setlocal spell spelllang=en_us
  set complete+=s
  set formatprg=par
  setlocal wrap
  setlocal linebreak
endfu
com! WP call WordProcessorMode()

func! DropBoxNoteSetup()
	exec enew
  "set working path
  "set to WP
  set syntax=markdown
endfu
com! NOTE call DropBoxNoteSetup()

func! DevMode()
  unmap j
  unmap k
  set ruler
  set relativenumber
endfu
com! DEV call DevMode()

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

set nolist
