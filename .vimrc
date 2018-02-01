" MYVIM_START
set encoding=utf-8

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
"Plugin 'valloric/youcompleteme'
"Plugin 'Shougo/neocomplcache'
"Plugin 'shougo/neosnippet.vim'
"Plugin 'Shougo/neosnippet-snippets'
"Plugin 'shougo/deoplete.nvim'

Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'

Plugin 'thaerkh/vim-workspace'
Plugin 'dzeban/vim-log-syntax'
Plugin 'leshill/vim-json'
"Plugin 'jaxbot/github-issues.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim
"if dein#load_state('~/.vim/bundles/')
"  call dein#begin('~/.vim/bundles/')
"
"  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim/')
"  call dein#add('Shougo/neocomplete.vim')
"
"  call dein#end()
"  call dein#save_state()
"endif

" non-Vundle stuff

" minimum defaults
syntax on
"filetype plugin indent on

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
  let s:vmode       = "cterm"
  " I reduced each "base" number by 7
  "    let s:base03      = "234"
  "    let s:base02      = "235"
  "    let s:base01      = "239"
  "    let s:base00      = "240"
  "    let s:base0       = "244"
  "    let s:base1       = "245"
  "    let s:base2       = "187"
  "    let s:base3       = "230"
  let s:base03      = "227"
  let s:base02      = "228"
  let s:base01      = "232"
  let s:base00      = "233"
  let s:base0       = "237"
  let s:base1       = "238"
  let s:base2       = "180"
  let s:base3       = "223"

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

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = '▶'
  let g:airline#extensions#tabline#left_alt_sep = '|'

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
"let g:deoplete#enable_at_startup = 1

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
set relativenumber
set hlsearch

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

" install sensible colors for diffs
highlight DiffAdd    cterm=bold ctermfg=none ctermbg=250 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=251 ctermbg=255 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=none ctermbg=250 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=16 ctermbg=51 gui=none guifg=bg guibg=Red

" tab keys for tabs
nmap <F4> :tabp<cr>
nmap <F5> :tabn<cr>
nmap <F6> :set norelativenumber nonumber GitGutterDisable<cr>
nmap <F7> :set number relativenumber GitGutterEnable<cr>
