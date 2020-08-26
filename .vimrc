" Sean Wingert's init.vim file
" w|so %|PlugInstall

" First things first
  set encoding=utf-8

" Enable vundle
  set nocompatible              " be iMproved, required
  filetype off                  " required

" Enable default plugins - cf book: 152 Practical Vim
  filetype plugin on
  runtime macros/matchit.vim

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" call plug#begin('~/.local/share/nvim/plugged')
call plug#begin('~/.vim/plugged')
" Plugs
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive' " Causes pumvisible to appear when using COC's pumvisible <cr>
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'raimondi/delimitmate'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/syntastic'
  Plug 'altercation/vim-colors-solarized'
  Plug 'dzeban/vim-log-syntax'
  " Plug 'vim-utils/vim-man' " neovim has a built–in man. View man pages in vim. Grep for the man pages. E.g., :Man printf
  Plug 'lbrayner/vim-rzip'  " Extends stock zip.vim to allow recursively browsing and writing zip files (EAR,WAR,JAR,etc.)
  Plug 'will133/vim-dirdiff'
  Plug 'elzr/vim-json' " json highlighting
  Plug 'stephpy/vim-yaml' " Much faster yaml highlighting than vim 7.4, as of Sept 2018. Good for helm's _helpers.tpl
  Plug 'mustache/vim-mustache-handlebars' " Go template syntax and coloration
  Plug 'ntpeters/vim-better-whitespace' " Find whitespace in unexpected places
  Plug 'christoomey/vim-tmux-navigator' " When combined with a set of tmux key bindings, the plugin will allow you to navigate seamlessly between vim and tmux splits using a consistent set of hotkeys.
  Plug 'itchyny/lightline.vim' " A statusline plugin that doesn't require powerline or vim-airline
  Plug 'godlygeek/tabular' " Aligns regions of text into columns
  Plug 'ryanoasis/vim-devicons' " Supports plugins such as NERDTree, vim-lightline, vim-airline, CtrlP, powerline ...
  Plug 'majutsushi/tagbar' " Warning: this slows down airvim
  Plug 'junegunn/fzf.vim'  " Fuzzy finder
  " Plug 'ervandew/supertab'
  Plug 'SirVer/ultisnips'    " Holger Rapp's snippets engine
  Plug 'honza/vim-snippets'  " 'UltiSnips comes without snippets. An excellent selection of snippets can be found here.'
  Plug 'jlanzarotta/bufexplorer' " Navigate buffers with :BufExplorer: 'be', 'bt', 'bs', 'bv' 'be'
  Plug 'AndrewRadev/splitjoin.vim'
  " Plug 'w0rp/ale' " Check syntax (linting) and fix files asynchronously, with Language Server Protocol (LSP) integration in Vim
  " Go stuff
  " Plug 'fatih/vim-go'
  " Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
  Plug 'rhysd/rust-doc.vim' " integrate rust documentation (cargo doc too) in vim
  Plug 'rust-lang/rust.vim' " Vim plugin that provides Rust file detection, syntax highlighting, formatting, Syntastic integration, and more.
  " Plug 'plasticboy/vim-markdown' " Good but slow. Still maintained in 2019.
  " Plug 'suan/vim-instant-markdown', {'for': 'markdown'} " When you open a markdown file in vim, a browser window will open which shows the compiled markdown in real-time, and closes once you close the file in vim.
  Plug 'z0mbix/vim-shfmt', { 'for': 'sh' } " The Vim shfmt plugin runs shfmt to auto format the current buffer
  Plug 'itspriddle/vim-shellcheck' " Vim wrapper for ShellCheck, a static analysis tool for shell scripts.
  Plug 'martinda/jenkinsfile-vim-syntax' " A plugin that enables Jenkins DSL job syntax coloring + indentation.
  Plug 'ekalinin/dockerfile.vim' " Vim syntax file for Docker's Dockerfile and snippets for snipMate.
  " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'lifepillar/vim-mucomplete'

" Optional plugins
  " Plug 'valloric/youcompleteme' " Use this instead of SuperTab, CtrlP, or vim-easytags

" I decided against all of these
  " Plug 'powerline/powerline' " To disable, do that here and below.
  " Plug 'vim-airline/vim-airline' " With airline and powerline enabled, powerline wins if its rtp is enabled, but :AirlineToggle twice helps
  " Plug 'vim-airline/vim-airline-themes'
  " Plug 'kien/ctrlp.vim'
  " Plug 'Shougo/neocomplcache'
  " Plug 'shougo/neosnippet.vim'
  " Plug 'Shougo/neosnippet-snippets'
  " Plug 'shougo/deoplete.nvim'
  " Plug 'xolox/vim-easytags'
  " Plug 'xolox/vim-misc'
  " Plug 'thaerkh/vim-workspace'
  " Plug 'jaxbot/github-issues.vim'
  " Plug 'ervandew/supertab'
  " Plug 'gabrielelana/vim-markdown'
  " Plug 'nginx.vim' " Provides syntax highlighting for nginx conf files
  " Plug 'mileszs/ack.vim'
  " Plug 'tpope/vim-obsession'  " Create sessions inside vim. I use tmux with resurrection instead
  " Plug 'Conque-Shell' " Conque is a Vim plugin allowing users to execute and interact with programs, typically a shell such as bash, inside a buffer window. The goal is always to keep the terminal behavior as close as possible to its native interface, while adding the additional features of Vim on top.

" All of your Vundle Plugs must be added BEFORE the following line
  " call vundle#end()            " required
  " filetype plugin indent on    " required

" Initialize plugin system
call plug#end() " Set vim defaults

  syntax on
  " set path+=**,~/** " For vim built-in :find, do it recursively
  " set path+=** " For vim built-in :find, just in the current dir (pwd)
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
" These are unnecessary when using Plug 'christoomey/vim-tmux-navigator'
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
  let g:NERDTreeDirArrowExpandable = ' '
  let g:NERDTreeDirArrowCollapsible = ' '
  " let g:NERDTreeDirArrowExpandable = '→'
  " let g:NERDTreeDirArrowCollapsible = '↓'
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
  au CursorHold,FocusGained,BufEnter * silent! checktime " This detects changes quickly
  set noautoread " This (basically) enables the prompt
  let g:tagbar_sort = 0 " tagbar: don't automatically sort

" Search tweaks
  set history=999
  set ignorecase " cf page 203 Practical vim
  set smartcase " ‘smartcase’ has the effect of canceling out the ‘ignorecase’ setting any time that we include an uppercase character in our search pattern.
  set incsearch " show a preview of the first match based on what has been entered so far into the search field. Each time we enter another character, Vim instantly updates the preview.
  set hlsearch " set relativenumber

" In visual mode (not normal mode), make * and # find the selected, not text under cursor. See page 232 of Pratical vim
  " xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
  " xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
  " function! s:VSetSearch(cmdtype)
  "   let temp = @s
  "   norm! gv"sy
  "   let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  "   let @s = temp
  " endfunction

" set color for trailing whitespace plugin 'ntpeters/vim-better-whitespace'
  highlight ExtraWhitespace ctermbg=51

" keys for tabs
  nmap <F4> :tabp<cr>
  nmap <F5> :tabn<cr>
  " nmap <F6> :set norelativenumber nonumber <bar> GitGutterDisable <cr>
  " nmap <F7> :set number <bar> GitGutterEnable <cr>

" Use cppman for keyword program -- Shift+K
  autocmd FileType cc set keywordprg=cppman
  autocmd FileType cpp set keywordprg=cppman

" Activate the window on partial name match with eg :sb vimrc (matches ~/.vimrc)
  set switchbuf+=useopen

" Mac: clipboard integration
set clipboard=unnamed

" Lightline tweaks
  set laststatus=2 " Always display the statusline in all windows
  " Enable fugitive branches in lightline
  let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
        \   'right': [ [ 'lineinfo' ],
        \              [ 'percent' ],
        \              [ 'fileformat', 'fileencoding', 'filetype', 'buffernum' ] ]
        \ },
        \ 'component': {
        \   'buffernum': 'buf %n'
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head',
        \   'filename': 'LightLineFilename'
        \ },
        \ }
    function! LightLineFilename()
      return expand('%:p')
    endfunction

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

 " " Ultisnips
 " " do this first to allow Dropbox, or similar, backups of ~/Documents/myultisnips:
 " "   mkdir ~/Documents/Ultisnips
 " "   ln -s ~/Documents/Ultisnips ~/.vim/Ultisnips
 " let g:UltiSnipsSnippetsDir = "~/.vim/Ultisnips"  " resulting behavior resembles UltiSnips Screencast - Ep 2 from the author
 " let g:UltiSnipsSnippetDirectories = ["Ultisnips"]
 " let g:UltiSnipsListSnippets = "<c-e>" " in insert mode, c-@ doesn't work but c-e work fine with ycm, supertab, vim-snippets, and ultisnips

 " " make YCM compatible with UltiSnips (using supertab)
 " " https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
 " let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
 " let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
 " let g:SuperTabDefaultCompletionType = '<C-n>'

 " " better key bindings for UltiSnipsExpandTrigger
 " let g:UltiSnipsExpandTrigger = "<tab>"
 " let g:UltiSnipsJumpForwardTrigger = "<tab>"
 " let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

 " If you want :UltiSnipsEdit to split your window.
 " let g:ultisnipseditsplit="vertical"

 " Configure netrw like NerdTREE: https://shapeshed.com/vim-netrw/
 " let g:netrw_banner = 0
 " let g:netrw_liststyle = 3
 " let g:netrw_browse_split = 4
 " let g:netrw_altv = 1
 " let g:netrw_winsize = 25
 " augroup netrw_mapping  " Override net-rw's control+l so it does what you expect -- https://vi.stackexchange.com/questions/5531/how-to-remap-i-in-netrw
 "   autocmd!
 "   autocmd filetype netrw call NetrwMapping()
 " augroup END
 " function! NetrwMapping()
 "   noremap <buffer> <c-l> <C-W>l
 " endfunction


" if no filetype is set, make it log and enable syntax highlighting
" https://stackoverflow.com/a/5492283/1231693
autocmd BufEnter * if &filetype == "" | setlocal ft=log | endif
autocmd BufNewFile,BufReadPost *log* :set filetype=log

" in nvim, these had to come later.  I'm not sure why
set background=light " If you don't have a light background (default), uncomment this line
hi Normal guibg=NONE ctermbg=NONE " disable the transparent(?) background to avoid odd background highlights

" FZF config
" ******************************************
  " map ctrl+p to fzf
  nnoremap <C-p> :FZF ~/git/dev-ops-tasks<Cr>
  " map ctrl+e to ag (silver surfer) with Preview
  nnoremap <C-e> :lcd ~/git/dev-ops-tasks <bar> :Ag!<Cr>
  " set rtp+=~/.fzf   " If installed with git
  set rtp+=/usr/local/opt/fzf  " If install with homebrew


  let g:fzf_tags_command = 'ctags --extra=+f -R'
  " let g:fzf_colors =
  "       \ { 'fg':      ['fg', 'Normal'],
  "       \ 'bg':      ['bg', 'Normal'],
  "       \ 'hl':      ['fg', 'Comment'],
  "       \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  "       \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  "       \ 'hl+':     ['fg', 'Statement'],
  "       \ 'info':    ['fg', 'PreProc'],
  "       \ 'prompt':  ['fg', 'Conditional'],
  "       \ 'pointer': ['fg', 'Exception'],
  "       \ 'marker':  ['fg', 'Keyword'],
  "       \ 'spinner': ['fg', 'Label'],
  "       \ 'header':  ['fg', 'Comment'] }
nmap <Leader>t :Files<CR>
nmap <Leader>be :BufExplorerHorizontalSplit<CR> " Previously, it was nmap <Leader>b :Buffers<CR>
nmap <Leader>a :Ag<CR>
nmap <Leader>c :Ack<CR>
nmap <Leader>m :FZFMru<CR>
nmap <Leader>s :Snippets<CR>
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
" ******************************************

" show buffer number in airline
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#buffer_nr_format = '%s: '

" show full path in vim-airline status line
"let g:airline_section_c = '%F'
" let g:airline_section_c =
"       \"%{bufnr('%')}: ".
"       \"%<%f%m %#__accent_red#".
"       \"%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"

" " " COC config
" " " *************************************
" " if hidden is not set, TextEdit might fail.
" set hidden
" 
" " Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup
" 
" " Better display for messages
" set cmdheight=2
" 
" " Smaller updatetime for CursorHold & CursorHoldI
" "set updatetime=300
" 
" " don't give |ins-completion-menu| messages.
" set shortmess+=c
" 
" " always show signcolumns
" " set signcolumn=yes
" 
" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" " inoremap <silent><expr> <TAB>
" "       \ pumvisible() ? "\<C-n>" :
" "       \ <SID>check_back_space() ? "\<TAB>" :
" "       \ coc#refresh()
" " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" " Use <c-space> to trigger completion.
" " inoremap <silent><expr> <c-space> coc#refresh()
" 
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" " inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" 
" " Use `[c` and `]c` to navigate diagnostics
" " nmap <silent> [c <Plug>(coc-diagnostic-prev)
" " nmap <silent> ]c <Plug>(coc-diagnostic-next)
" " 
" " " Remap keys for gotos
" " nmap <silent> gd <Plug>(coc-definition)
" " nmap <silent> gy <Plug>(coc-type-definition)
" " nmap <silent> gi <Plug>(coc-implementation)
" " nmap <silent> gr <Plug>(coc-references)
" 
" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" 
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
" 
" " Highlight symbol under cursor on CursorHold
" " autocmd CursorHold * silent call CocActionAsync('highlight')
" 
" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
" 
" " Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" 
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
" 
" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" 
" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)
" 
" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')
" 
" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" 
" 
" " Add diagnostic info for https://github.com/itchyny/lightline.vim
" " let g:lightline = {
" "       \ 'colorscheme': 'wombat',
" "       \ 'active': {
" "       \   'left': [ [ 'mode', 'paste' ],
" "       \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
" "       \ },
" "       \ 'component_function': {
" "       \   'cocstatus': 'coc#status'
" "       \ },
" "       \ }
" 
" 
" 
" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" " " " *************************************

" " mucomplete
" set completeopt+=menuone
" set completeopt+=noselect
" let g:mucomplete#enable_auto_at_startup = 1

" imap <c-j> <plug>(MUcompleteFwd)
" imap <c-k> <plug>(MUcompleteBwd)

" " https://github.com/lifepillar/vim-mucomplete/issues/46
" let g:mucomplete#can_complete = {
"   \ 'default': {
"   \    'omni': { t -> strlen(&l:omnifunc) > 0 && t =~# '\%(\k\k\|\.\)$' }
"   \    }
"   \  }

" Pmenu colors (completion window).
:highlight Pmenu     ctermfg=16 ctermbg=255 guibg=yellow cterm=bold
:highlight PmenuSel  ctermfg=16 ctermbg=214 guibg=yellow cterm=bold

" vim-go config
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"

let g:AutoClosePreserveDotReg = 0

" disable swap files OR customize their locations: https://vi.stackexchange.com/a/179/15006
set noswapfile
" set backupdir=.backup/,~/.backup/,/tmp//
" set directory=.swp/,~/.swp/,/tmp//
" set undodir=.undo/,~/.undo/,/tmp//

" use :grep for ag
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

" Type Grep for fastest ag search: https://github.com/ggreer/the_silver_searcher/issues/1341
abbr Grep copen \| silent! grep!

" auto-fit by default
let g:vim_markdown_toc_autofit = 1

" In shfmt, use spaces instead of the default tabs
let g:shfmt_extra_args = '-i 2'

" Read the current git branch name: https://stackoverflow.com/a/12142066/1231693
nnoremap <Leader>br :r !git rev-parse --abbrev-ref HEAD \| tr '-' ' '<cr>ggdd0daW$

" These need to come last, or near last, for some reason.
" Install sensible colors for diffs
  highlight DiffAdd    cterm=bold ctermfg=none ctermbg=250 gui=none guifg=bg guibg=Red
  highlight DiffDelete cterm=bold ctermfg=251 ctermbg=255 gui=none guifg=bg guibg=Red
  highlight DiffChange cterm=bold ctermfg=none ctermbg=250 gui=none guifg=bg guibg=Red
  highlight DiffText   cterm=bold ctermfg=16 ctermbg=51 gui=none guifg=bg guibg=Red
  highlight DebugBreak cterm=bold ctermfg=none ctermbg=250 gui=none guifg=bg guibg=Red

" Don't use tab for these files. Alternatively, put this in ~/vim/ftplugin/yaml.vim
autocmd FileType yaml        setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType Jenkinsfile setlocal ts=2 sts=2 sw=2 expandtab
" make tab key input 2 spaces instead of tab character
set ts=2 sw=2 et sta ai
