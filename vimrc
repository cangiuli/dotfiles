" .vimrc
" Carlo Angiuli

set ttyfast                  " smoother scrolling
set showcmd                  " shows command in status line
set background=dark          " brighter colors for dark terminals
set expandtab                " don't use actual tabs
set tabstop=2                " tabs are two spaces
set shiftwidth=2             " auto-tabs are two spaces
set textwidth=80             " break lines after 80 cols
set showmatch                " highlight matching brackets
set ruler                    " display position
set smartindent              " indent in a C-like fashion
syntax on                    " syntax highlighting
set foldmethod=marker        " allow persistent folds
set hlsearch                 " highlight search matches
set belloff=all              " disable bell/flash
set laststatus=2             " always show status line
filetype indent on           " use filetype-specific indentation
filetype plugin on           " use filetype-specific plugins

if ($VIM_TERMINAL)
  syntax off
endif

" fzf.vim, gruvbox, vim-redprl, vim-redtt, vimtex
set runtimepath+=~/.fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-j> :RG<CR>

let g:vimtex_imaps_enabled = 0
let g:vimtex_matchparen_enabled = 0
let g:vimtex_view_method = has("mac") ? "skim" : "zathura"
au FileType tex setlocal indentexpr=

packadd! matchit
let g:netrw_banner=0         " netrw: no banner
let g:netrw_liststyle=3      " netrw: tree view
let g:redprl_path = $HOME . '/sml-redprl/bin/redprl'
let g:redtt_path = $HOME . '/Documents/redtt/_build/install/default/bin/redtt'
au FileType redprl nnoremap <F5> :RedPRL<CR>

" bindings
let maplocalleader=","
nnoremap <C-L> :nohlsearch<CR><C-L>

" filetypes
au BufNewFile,BufRead *.tut,*.req setf tutch             " Tutch
au BufNewFile,BufRead *.elf,*.thm,sources.cfg setf twelf " Twelf
au BufNewFile,BufRead *.clf setf twelf                   " Celf
au BufNewFile,BufRead *.w setf scheme                    " ChezWEB
au BufNewFile,BufRead *.v setf coq                       " Coq, not Verilog
au BufNewFile,BufRead *.agda setf agda                   " Agda
au BufNewFile,BufRead *.smt2 setf lisp                   " SMT 2
au BufNewFile,BufRead *.sig,*.fun setf sml               " SML
au BufNewFile,BufRead *.ctt setf cubicaltt               " cubicaltt
au BufNewFile,BufRead *.ytt setf cubicaltt               " yacctt

" special filetype behaviors
au FileType make setlocal noexpandtab    " use literal tabs in Makefiles
au FileType scheme syn sync minlines=100 " handle long comments in ChezWEB

" show explicit tab characters
set lcs=tab:⇥\ 
set list!

" terminal escape sequences must be typed quickly, to make ^[O bearable
set timeout timeoutlen=500 ttimeoutlen=100

" comments are dark green as nature intended, instead of bright cyan
hi Comment ctermfg=DarkGreen

" gvim-specific settings
au GuiEnter * set belloff=all
set guioptions-=m
set guioptions-=r
set guioptions-=T
set guioptions-=L
if has("gui_running")
  colorscheme gruvbox
  set background=light
  if has("mac")
    set guifont=PragmataPro\ Mono:h16
  else
    set guifont=PragmataPro\ Mono\ 13
  endif
endif
