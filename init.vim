" color koehler
runtime macros/matchit.vim

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/swingerus.ibm.com/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/swingerus.ibm.com/.cache/dein')
  call dein#begin('/Users/swingerus.ibm.com/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/swingerus.ibm.com/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('justmao945/vim-clang', {'on_ft': ['c', 'cpp']})        " lazy load on filetype
  call dein#add('scrooloose/nerdtree', {'on_cmd': 'NERDTreeToggle'})    " lazy load on command executed
  call dein#add('Shougo/deoplete.nvim', {'on_i': 1})                    " lazy load on insert mode
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " lazy load on function call
  call dein#add('othree/eregex.vim', {'on_func': 'eregex#toggle'})

  call dein#add('carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' })
  call dein#add('deoplete-plugins/deoplete-jedi')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('fatih/vim-go')

  " solarized
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('altercation/vim-colors-solarized', {'merged': 0})
  call dein#source('vim-colors-solarized')
  colorscheme solarized

  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-fugitive')
  call dein#add('raimondi/delimitmate')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/syntastic')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('tpope/vim-surround')
  call dein#add('dzeban/vim-log-syntax')
  call dein#add('jez/vim-superman') " View man pages in vim. Grep for the man pages. E.g., :Man printf
  " call dein#add('mileszs/ack.vim')
  call dein#add('lbrayner/vim-rzip')  " Extends stock zip.vim to allow recursively browsing and writing zip files (EAR,WAR,JAR,etc.)
  call dein#add('will133/vim-dirdiff')
  call dein#add('elzr/vim-json') " json highlighting
  call dein#add('stephpy/vim-yaml') " Much faster yaml highlighting than vim 7.4, as of Sept 2018. Good for helm's _helpers.tpl
  call dein#add('mustache/vim-mustache-handlebars') " Go template syntax and coloration
  call dein#add('ntpeters/vim-better-whitespace') " Find whitespace in unexpected places
  call dein#add('christoomey/vim-tmux-navigator') " When combined with a set of tmux key bindings, the plugin will allow you to navigate seamlessly between vim and tmux splits using a consistent set of hotkeys.
  " call dein#add('itchyny/lightline.vim') " A statusline plugin that doesn't require powerline or vim-airline
  call dein#add('ryanoasis/vim-devicons') " Supports plugins such as NERDTree, vim-lightline, vim-airline, CtrlP, powerline ...
  call dein#add('majutsushi/tagbar') " Warning: this slows down airvim
  call dein#add('junegunn/fzf.vim')  " Fuzzy finder
  " call dein#add('nginx.vim') " provides syntax highlighting for nginx conf files
  call dein#add('ervandew/supertab')
  call dein#add('SirVer/ultisnips')    " Holger Rapp's snippets engine
  call dein#add('honza/vim-snippets')  " 'UltiSnips comes without snippets. An excellent selection of snippets can be found here.'

  call dein#add('godlygeek/tabular')
  " call dein#add('plasticboy/vim-markdown')
  call dein#add('wincent/command-t')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Set vim defaults
  syntax on
  " set path+=**,~/** " For vim built-in :find, do it recursively
  set path+=** " For vim built-in :find, do it recursively
  " set wildmenu wildmode=longest,list " acts like bash, not selectable
  set wildmenu wildmode=full "acts like zsh, selectable

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
    " NOTE: I reduced each "base" number by 7
      " let s:base03      = "234"
      " let s:base02      = "235"
      " let s:base01      = "239"
      " let s:base00      = "240"
      " let s:base0       = "244"
      " let s:base1       = "245"
      " let s:base2       = "187"
      " let s:base3       = "230"
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
  " hi Normal guibg=NONE ctermbg=NONE " disable the transparent(?) background to avoid odd background highlights

" Performance tweaks
  set timeoutlen=1000 ttimeoutlen=0 " Eliminating delays on ESC in vim and zsh. Timeoutlen is used for mapping delays, and ttimeoutlen is used for key code delays.

" Faster window mapping -- do NOT make comments (quotes) after mapping statements, as it causes trouble/alert sound
" These are unnecessary when using Plugin 'christoomey/vim-tmux-navigator'
  " nnoremap <C-h> <C-w>h
  " nnoremap <C-j> <C-w>j
  " nnoremap <C-k> <C-w>k
  " nnoremap <C-l> <C-w>l

  " In tmux on CentOS 7.4 (others too?), vim's Ctrl+H fails. The map below fixes it. Details https://github.com/ranger/ranger/issues/559
  nnoremap <bs> <C-w>h

" NERDTree
silent! nmap <F1> :NERDTreeToggle<CR>
silent! nmap <F2> :NERDTreeFind<CR>
silent! nmap <F3> :TagbarToggle<CR>
let g:NERDTreeDirArrowExpandable = '→'
let g:NERDTreeDirArrowCollapsible = '↓'
" Optional, in case your terminal's font can't handle arrows
" let NERDTreeDirArrowExpandable = "+"
" let NERDTreeDirArrowCollapsible = "-"

" Misc
  " let mapleader = "," " Set the Leader. Don't remove ; or , as suggested in Practical Vim, pg 122
  " set listchars=eol:$,tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· " Display tabs and spaces, when you say :set list
  set listchars=eol:⏎,tab:▸↹,trail:·,extends:>,precedes:⏎,nbsp:·
  " set mouse=a " Enable mouse
  " set ttymouse=xterm2 " allow mouse in tmux
  let g:go_version_warning = 0 " if you don't have Go installed, don't complain
  set infercase " Page 292 of Practical vim
  set number
  " Detect filesystem changes ASAP
  " https://stackoverflow.com/questions/923737/detect-file-change-offer-to-reload-file
  " http://vim.wikia.com/wiki/Have_Vim_check_automatically_if_the_file_has_changed_externally
  " au CursorHold,FocusGained,BufEnter * silent! checktime
  " neovim specific: https://github.com/neovim/neovim/issues/3326  (they
  " suggest autoread, but that automatically reads in new updates, whereas I
  " want a prompt)
  set noautoread
  au FocusGained * :checktime

" Search tweaks
  set history=999
  set ignorecase " cf page 203 Practical vim
  set smartcase " ‘smartcase’ has the effect of canceling out the ‘ignorecase’ setting any time that we include an uppercase character in our search pattern.
  set incsearch " show a preview of the first match based on what has been entered so far into the search field. Each time we enter another character, Vim instantly updates the preview.
  set hlsearch " set relativenumber

" In visual mode (not normal mode), make * and # find the selected, not text under cursor. See page 232 of Pratical vim
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
  highlight DebugBreak cterm=bold ctermfg=none ctermbg=250 gui=none guifg=bg guibg=Red

" set color for trailing whitespace plugin 'ntpeters/vim-better-whitespace'
  highlight ExtraWhitespace ctermbg=51

" keys for tabs
  nmap <F4> :tabp<cr>
  nmap <F5> :tabn<cr>
  " nmap <F6> :set norelativenumber nonumber <bar> GitGutterDisable <cr>
  " nmap <F7> :set number <bar> GitGutterEnable <cr>

" In .cc or .cpp files, use cppman for keyword program -- Shift+K
  autocmd FileType cc set keywordprg=cppman
  autocmd FileType cpp set keywordprg=cppman

" Activate the window on partial name match with eg :sb vimrc (matches ~/.vimrc)
  set switchbuf+=useopen

" Mac: clipboard integration
set clipboard=unnamed

" " Lightline tweaks
"   set laststatus=2 " Always display the statusline in all windows
"   " Enable fugitive branches in lightline
"   let g:lightline = {
"         \ 'colorscheme': 'solarized',
"         \ 'active': {
"         \   'left': [ [ 'mode', 'paste' ],
"         \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
"         \   'right': [ [ 'lineinfo' ],
"         \              [ 'percent' ],
"         \              [ 'fileformat', 'fileencoding', 'filetype', 'buffernum' ] ]
"         \ },
"         \ 'component': {
"         \   'buffernum': 'buf %n'
"         \ },
"         \ 'component_function': {
"         \   'gitbranch': 'fugitive#head',
"         \   'filename': 'LightLineFilename'
"         \ },
"         \ }
"     function! LightLineFilename()
"       return expand('%:p')
"     endfunction

" fzf search
  " set rtp+=~/.fzf   " If installed with git
  set rtp+=/usr/local/opt/fzf  " If installed with homebrew

" Resize windows
" http://vim.wikia.com/wiki/Fast_window_resizing_with_plus/minus_keys
" Resize windows. These are key bindings, but see also Ultisnips.
if bufwinnr(1)
  nnoremap <Up> <C-W>2+
  nnoremap <Down> <C-W>2-
  nnoremap <Left> <C-W>2<
  nnoremap <Right> <C-W>2>
  " As far as Vim is concerned, <C-M> and <CR> are the same thing:
  " nnoremap <C-m> <C-W>_ <C-W><Bar>
  " nnoremap <C-n> :hide<CR> " minimize
  " nnoremap <C-e> <C-W>2= " equalize
endif

" Don't print Ack output while searching. Details: https://github.com/mileszs/ack.vim/issues/18
" function Search(string) abort
"   let saved_shellpipe = &shellpipe
"   let &shellpipe = '>'
"   try
"     execute 'Ack!' shellescape(a:string, 1)
"   finally
"     let &shellpipe = saved_shellpipe
"   endtry
" endfunction

 " Ultisnips
 " do this first to allow Dropbox, or similar, backups of ~/Documents/myultisnips:
 "   mkdir ~/Documents/Ultisnips
 "   ln -s ~/Documents/Ultisnips ~/.vim/Ultisnips
 let g:UltiSnipsSnippetsDir = "~/.vim/Ultisnips"  " resulting behavior resembles UltiSnips Screencast - Ep 2 from the author
 let g:UltiSnipsSnippetDirectories = ["Ultisnips"]
 let g:UltiSnipsListSnippets = "<c-e>" " c-@ doesn't work but c-e work fine with ycm, supertab, vim-snippets, and ultisnips

 " https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
 " make YCM compatible with UltiSnips (using supertab)
 let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
 let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
 let g:SuperTabDefaultCompletionType = '<C-n>'

 " better key bindings for UltiSnipsExpandTrigger
 let g:UltiSnipsExpandTrigger = "<tab>"
 let g:UltiSnipsJumpForwardTrigger = "<tab>"
 let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

 " Suggestion from UltiSnips: Ultisnips Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
 " let g:UltiSnipsExpandTrigger="<tab>"
 " let g:UltiSnipsJumpForwardTrigger="<c-b>"
 " let g:UltiSnipsJumpBackwardTrigger="<c-z>"

 " If you want :UltiSnipsEdit to split your window.
 let g:ultisnipseditsplit="vertical"

 " Configure netrw like NerdTREE: https://shapeshed.com/vim-netrw/
 " let g:netrw_banner = 0
 let g:netrw_liststyle = 3
 let g:netrw_browse_split = 4
 let g:netrw_altv = 1
 let g:netrw_winsize = 25
 augroup netrw_mapping  " Override net-rw's control+l so it does what you expect -- https://vi.stackexchange.com/questions/5531/how-to-remap-i-in-netrw
   autocmd!
   autocmd filetype netrw call NetrwMapping()
 augroup END
 function! NetrwMapping()
   noremap <buffer> <c-l> <C-W>l
 endfunction

" make tab key input 2 spaces instead of tab character
set ts=2 sw=2 et sta ai

" if no filetype is set, make it log
" https://stackoverflow.com/a/5492283/1231693
autocmd BufEnter * if &filetype == "" | setlocal ft=log | endif

" enable syntax highlighting on .log filetype
autocmd BufNewFile,BufReadPost *log* :set filetype=log

let g:airline_theme="molokai"

" in nvim, these had to be last. I'm not sure why
set background=light " If you don't have a light background (default), uncomment this line
hi Normal guibg=NONE ctermbg=NONE " disable the transparent(?) background to avoid odd background highlights

" map ctrl+p to fzf
nnoremap <C-p> :Files<Cr>

" map ctrl+e to ag (silver surfer) with Preview
nnoremap <C-e> :Ag!<Cr>

    set rtp+=/usr/local/opt/fzf
     
    let g:fzf_tags_command = 'ctags --extra=+f -R'
    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

nmap <Leader>t :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>a :Ag<CR>
nmap <Leader>c :Ack<CR>

" show buffer number in airline
let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#buffer_nr_format = '%s: '

" show full path in vim-airline status line
"let g:airline_section_c = '%F'
let g:airline_section_c =
      \"%{bufnr('%')}: ".
      \"%<%f%m %#__accent_red#".
      \"%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"

" source highlighting for fzf previews
" https://github.com/junegunn/fzf.vim/issues/184 and https://unix.stackexchange.com/questions/90990/less-command-and-syntax-highlighting/90992
let g:fzf_files_options = '--preview "(bat --color=always --style=full --line-range :300 --theme=OneHalfLight {} || coderay {} || less {}) 2> /dev/null | head -'.&lines.'"'

" Details: help fzf > Advanced Customizations
" :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Most Recently Used files list
" https://github.com/junegunn/fzf/wiki/Examples-(vim)
command! FZFMru call fzf#run({ 'source': v:oldfiles, 'sink': 'e', 'options': '-m -x +s', 'down': '40%'})
