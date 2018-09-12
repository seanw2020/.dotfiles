" Sean Wingert's .vimrc file
" w|so %|PluginInstall

" First things first
set encoding=utf-8

" Enable vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" Enable default plugins - cf book: 152 Practical Vim
filetype plugin on
runtime macros/matchit.vim

"excellent  set the runtime path (rtp) to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()" let Vundle manage Vundle, required

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'raimondi/delimitmate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-obsession'
Plugin 'dzeban/vim-log-syntax'
Plugin 'vim-utils/vim-man' " View man pages in vim. Grep for the man pages. E.g., :Man printf
Plugin 'fatih/vim-go'
Plugin 'mileszs/ack.vim'
Plugin 'lbrayner/vim-rzip'  " Extends stock zip.vim to allow recursively browsing and writing zip files (EAR,WAR,JAR,etc.)
Plugin 'will133/vim-dirdiff'
Plugin 'elzr/vim-json' " json highlighting
Plugin 'stephpy/vim-yaml' " Much faster yaml highlighting than vim 7.4, as of Sept 2018. Good for helm's _helpers.tpl
Plugin 'mustache/vim-mustache-handlebars' " Go template syntax and coloration
Plugin 'ntpeters/vim-better-whitespace' " Find whitespace in unexpected places
Plugin 'christoomey/vim-tmux-navigator' " When combined with a set of tmux key bindings, the plugin will allow you to navigate seamlessly between vim and tmux splits using a consistent set of hotkeys.
Plugin 'itchyny/lightline.vim' " A statusline plugin that doesn't require powerline or vim-airline
Plugin 'ryanoasis/vim-devicons' " Supports plugins such as NERDTree, vim-lightline, vim-airline, CtrlP, powerline ...
Plugin 'majutsushi/tagbar' " Warning: this slows down airvim

" Optional plugins
" Plugin 'powerline/powerline' " To disable, do that here and below.
" Plugin 'vim-airline/vim-airline' " With airline and powerline enabled, powerline wins if its rtp is enabled, but :AirlineToggle twice helps
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'Conque-Shell' " Conque is a Vim plugin allowing users to execute and interact with programs, typically a shell such as bash, inside a buffer window. The goal is always to keep the terminal behavior as close as possible to its native interface, while adding the additional features of Vim on top.
" Plugin 'valloric/youcompleteme' " Use this instead of SuperTab, CtrlP, or vim-easytags

" I decided against all of these
  "Plugin 'kien/ctrlp.vim'
  "Plugin 'Shougo/neocomplcache'
  "Plugin 'shougo/neosnippet.vim'
  "Plugin 'Shougo/neosnippet-snippets'
  "Plugin 'shougo/deoplete.nvim'
  "Plugin 'xolox/vim-easytags'
  "Plugin 'xolox/vim-misc'
  "Plugin 'thaerkh/vim-workspace'
  "Plugin 'jaxbot/github-issues.vim'
  "Plugin 'ervandew/supertab'

" All of your Vundle Plugins must be added BEFORE the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Set vim defaults
syntax on
set path+=** " For vim built-in :find, do it recursively
set wildmenu wildmode=longest,list

" Solarized settings
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
    colorscheme solarized " The following must come AFTER the let statements or the colors fail to load properly!
  " set background=dark " If you don't have a light background (default), uncomment this line
  hi Normal guibg=NONE ctermbg=NONE " disable the transparent(?) background to avoid odd background highlights

" " Airline
"   " Setup
"       let g:airline_powerline_fonts = 1
"       if !exists('g:airline_symbols')
"           let g:airline_symbols = {} " initialize symbols for overriding below
"       endif
"   " Airline unicode symbols. Use this is your font does not support powerline glyphs
"       let g:airline_symbols.crypt = '※'
"       let g:airline_symbols.linenr = '☰'
"       let g:airline_symbols.linenr = 'LF'
"       let g:airline_symbols.linenr = 'NL'
"       let g:airline_symbols.linenr = '¶'
"       let g:airline_symbols.maxlinenr = ''
"       let g:airline_symbols.maxlinenr = '㏑'
"       let g:airline_symbols.branch = '♆'
"       let g:airline_symbols.paste = 'ρ'
"       let g:airline_symbols.paste = 'Þ'
"       let g:airline_symbols.paste = '∥'
"       let g:airline_symbols.paste = '☍'
"       let g:airline_symbols.paste = '⊕'
"       let g:airline_symbols.spell = '☒'
"       let g:airline_symbols.notexists = '☠'
"       let g:airline_symbols.whitespace = 'Ξ'
"   " Airline symbols. These only work if you have a powerline font set in your terminal
"       let g:airline_left_sep = ''
"       let g:airline_left_alt_sep = ''
"       let g:airline_right_sep = ''
"       let g:airline_right_alt_sep = ''
"       let g:airline_symbols.branch = ''
"       let g:airline_symbols.readonly = ''
"       let g:airline_symbols.linenr = ''
"   " Select this theme
"       let g:airline_theme='base16'

" " Powerline
"   " On Vim 8 (eg Fedora), or any host using python3, uncomment this to enable powerline
"       " python3 from powerline.vim import setup as powerline_setup
"       " python3 powerline_setup()
"       " python3 del powerline_setup

"   " On Vim 7, or any host using python 2, use these for powerline
"       set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim/
"       set laststatus=2 " Always display the statusline in all windows
"       set showtabline=2 " Always display the tabline, even if there is only one tab
"       set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
"       set t_Co=256 " Allow all text colors

"   " Settings
"       let g:Powerline_symbols = 'fancy'
"       let g:Powerline_symbols='unicode'

" Performance tweaks
set timeoutlen=1000 ttimeoutlen=0 " Eliminating delays on ESC in vim and zsh. Timeoutlen is used for mapping delays, and ttimeoutlen is used for key code delays.

" Faster window mapping -- do NOT make comments (quotes) after mapping statements, as it causes trouble/alert sound
" These are unnecessary when using Plugin 'christoomey/vim-tmux-navigator'
  " nnoremap <C-h> <C-w>h
  " nnoremap <C-j> <C-w>j
  " nnoremap <C-k> <C-w>k
  " nnoremap <C-l> <C-w>l
  "
  " In tmux on CentOS 7.4 (others too?), vim's Ctrl+H fails. The map below fixes it. Details https://github.com/ranger/ranger/issues/559
  nnoremap <bs> <C-w>h

" NERDTree
silent! nmap <F1> :NERDTreeToggle<CR>
silent! nmap <F2> :NERDTreeFind<CR>
silent! nmap <F3> :TagbarToggle<CR>

" Misc
let mapleader = "," " Set the Leader
set listchars=eol:⏎,tab:▸↹,trail:·,extends:>,precedes:⏎ " Display tabs and spaces, when you say :set list
set mouse=a " Enable mouse
let g:go_version_warning = 0 " if you don't have Go installed, don't complain
set infercase " Page 292 of Practical vim
set number

" Search tweaks
set history=999
set ignorecase " cf page 203 Practical vim
set smartcase " ‘smartcase’ has the effect of canceling out the ‘ignorecase’ setting any time that we include an uppercase character in our search pattern.
set incsearch " show a preview of the first match based on what has been entered so far into the search field. Each time we enter another character, Vim instantly updates the preview.
set hlsearch " set relativenumber

" In visual mode, make * and # find the selected, not text under cursor. See page 232 of Pratical vim
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" install sensible colors for diffs
highlight DiffAdd    cterm=bold ctermfg=none ctermbg=250 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=251 ctermbg=255 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=none ctermbg=250 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=16 ctermbg=51 gui=none guifg=bg guibg=Red

" keys for tabs
nmap <F4> :tabp<cr>
nmap <F5> :tabn<cr>
nmap <F6> :set norelativenumber nonumber <bar> GitGutterDisable <cr>
nmap <F7> :set number <bar> GitGutterEnable <cr>

" Use cppman for keyword program -- Shift+K
autocmd FileType cc set keywordprg=cppman
autocmd FileType cpp set keywordprg=cppman

" Activate the window on partial name match with eg :sb 1.yaml
set switchbuf+=useopen
