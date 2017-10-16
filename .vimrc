" MYVIM_START
set encoding=utf-8

" enable pathogen
execute pathogen#infect()

" Enable vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" Enable default plugins - cf book: 152 Practical Vim
filetype plugin on
runtime macros/matchit.vim

"excellent  set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()" let Vundle manage Vundle, required

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-commentary'
"Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'raimondi/delimitmate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'Shougo/neocomplcache'
Plugin 'shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'shougo/deoplete.nvim'

Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set runtimepath+=/home/ibmadmin/.vim/bundles/repos/github.com/Shougo/dein.vim
if dein#load_state('/home/ibmadm/.vim/bundles/')
  call dein#begin('/home/ibmadmin/.vim/bundles/')

  call dein#add('/home/ibmadmin/.vim/bundles/repos/github.com/Shougo/dein.vim/')
  call dein#add('Shougo/neocomplete.vim')

  call dein#end()
  call dein#save_state()
endif

" non-Vundle stuff 

" minimum defaults
syntax on
filetype plugin indent on

" if running in diff mode (e.g., vimdiff)
if &diff
  colorscheme mydiff
  windo set wrap
else
  colorscheme solarized
  " Use these for Putty without solarized palette
  let g:solarized_termcolors= 256
  let g:solarized_termtrans = 0
  let g:solarized_degrade = 0
  let g:solarized_bold = 1
  let g:solarized_underline = 1
  let g:solarized_italic = 1
  let g:solarized_contrast = "normal"
  let g:solarized_visibility= "normal"

  " The following must come AFTER the let statements or the colors fail to load properly!
  colorscheme solarized

  " I assume you have light background (default), but if not uncomment next line
  " set background=dark

  " disable the transparent(?) background to avoid odd background highlights
  hi Normal guibg=NONE ctermbg=NONE
endif

" MYVIM_END
"let g:airline_powerline_fonts = 1
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols='unicode'

" For vim built-in :find, do it recursively
:set path+=**

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

" unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '※'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.linenr = 'LF'
  let g:airline_symbols.linenr = 'NL'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '♆'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = '☒'
  let g:airline_symbols.notexists = '☠'
  let g:airline_symbols.whitespace = 'Ξ'

set timeoutlen=1000 ttimeoutlen=0
let g:tmux_navigator_no_mappings = 1

" Faster window mapping
nnoremap <C-h> <C-w>h " only C-h does not work.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <BS> <C-w>h

" https://stackoverflow.com/questions/10303557/map-f2-to-neerdtreetoggle
"silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
"let g:NERDTreeMapActivateNode="<F2>"
"let g:NERDTreeMapPreview="<F4>"

" toggles
nmap <F1> :NERDTreeToggle<CR>
"map <Leader>N :NERDTreeToggle<CR>
nmap <F2> :TagbarToggle<CR>

" Leader
let mapleader = ","

" Control+P
let g:ctrlp_show_hidden = 1

let g:python_host_prog = '/path/to/python2.7'
let g:deoplete#enable_at_startup = 1

" no plugins required for these
set path+=**
set wildmenu

" Tabs and spaces
set listchars=eol:⏎,tab:▸↹,trail:·,extends:>,precedes:⏎

" Mouse
set mouse=a

" Misc
set history=200
set ignorecase " cf page 203 Practical vim
set smartcase
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l> " cf 219 Practical Vim
set incsearch

" page 232 of Pratical vim
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" Page 292 of Practical vim
set infercase
