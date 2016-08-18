" .vimrc
" Carlo Angiuli

call pathogen#infect()

set nocompatible      " no vi compatibility
set ttyfast           " smoother scrolling
set showcmd           " shows command in status line
set background=dark   " brighter colors for dark terminals
set expandtab         " don't use actual tabs
set tabstop=2         " tabs are two spaces
set shiftwidth=2      " auto-tabs are two spaces
set tw=80             " break lines after 80 cols
set showmatch         " highlight matching brackets
set ruler             " display position
set smartindent       " indent in a C-like fashion
syntax on             " syntax highlighting
set foldmethod=marker " allow persistent folds
set hlsearch          " highlight search matches
set visualbell t_vb=  " disable bell/flash
filetype indent on    " use filetype-specific indentation settings

" bindings
nmap <F5> :make!<CR><CR><CR>
nnoremap <C-L> :nohlsearch<CR><C-L>

" filetypes
au BufNewFile,BufRead *.tut,*.req setf tutch             " Tutch
au BufNewFile,BufRead *.elf,*.thm,sources.cfg setf twelf " Twelf
au BufNewFile,BufRead *.clf setf twelf                   " Celf
au BufNewFile,BufRead *.w setf scheme                    " ChezWEB
au BufNewFile,BufRead *.v setf coq                       " Coq, not Verilog
au BufNewFile,BufRead *.agda setf agda                   " Agda
au BufNewFile,BufRead *.smt2 setf lisp                   " SMT 2
au BufNewFile,BufRead *.sig setlocal ft=sml              " SML

" special filetype behaviors
au FileType make setlocal noexpandtab    " use literal tabs in Makefiles
au FileType scheme syn sync minlines=100 " handle long comments in ChezWEB

" show explicit tab characters; messes up PuTTY
set lcs=tab:⇥\ 
set list!

" terminal escape sequences must be typed quickly, to make ^[O bearable
set timeout timeoutlen=5000 ttimeoutlen=100

" use more colors unless your terminal is awful
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" comments are dark green as nature intended, instead of bright cyan
hi Comment ctermfg=DarkGreen

" in tex files, default to making with pdflatex
au FileType tex call TexSettings()
function TexSettings()
  if !(filereadable('Makefile') || filereadable('makefile'))
    setlocal makeprg=pdflatex\ %
  end
endfunction

" enable matchit
filetype plugin on
runtime macros/matchit.vim

" text objects for inline math
onoremap <silent> a$ :<C-u>normal F$vf$<CR>
onoremap <silent> i$ :<C-u>normal T$vt$<CR>

" gvim-specific settings
au GuiEnter * set visualbell t_vb=
set guioptions-=m
set guioptions-=r
set guioptions-=T
set guioptions-=L
if has("gui_running")
  colorscheme solarized
endif
