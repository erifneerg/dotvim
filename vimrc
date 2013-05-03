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

""Syntax
Bundle 'cakebaker/scss-syntax.vim'
"Bundle 'tpope/vim-markdown'
"Bundle 'plasticboy/vim-markdown'

"interface
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'nathanaelkane/vim-indent-guides'

"Search
Bundle 'kien/ctrlp.vim'

"Auto typing
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'

Bundle 'garbas/vim-snipmate'
Bundle 'AutoComplPop'
Bundle 'honza/vim-snippets'
"Bundle 'ervandew/supertab'

"Bundle 'Shougo/neocomplcache'
"Bundle 'JazzCore/neocomplcache-ultisnips'
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
colorscheme monokai

"Light colorscheme
"colorscheme 

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

"Quick working path change
""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<Cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Whitespace
""""""""""""
"set list listchars=tab:\ \ ,trail:·

" help with osx clipboard fun stuff
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin"
    set clipboard=unnamed
  endif
endif
    
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
au BufRead,BufNewFile *.scss set filetype=scss

"ctrlP
""""""
let g:ctrlp_working_path_mode =0
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.sass-cache$\'

"search clear
nnoremap <F3> :set hlsearch!<CR>

"balanace 
let delimitMate_balance_matchpairs = 1

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
