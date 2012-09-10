" .vimrc
" Carlo Angiuli

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

" bindings
nmap <F5> :make<CR><CR><CR>

" filetypes
au BufNewFile,BufRead *.tut,*.req setf tutch       " Tutch
au BufNewFile,BufRead *.elf,sources.cfg setf twelf " Twelf
au BufNewFile,BufRead *.clf setf twelf             " Celf
au BufNewFile,BufRead *.w setf scheme              " ChezWEB
au BufNewFile,BufRead *.v setf coq                 " Coq, not Verilog

" special filetype behaviors
au FileType make setlocal noexpandtab    " use literal tabs in Makefiles
au FileType scheme syn sync minlines=100 " handle long comments in ChezWEB

" show explicit tab characters; messes up PuTTY
set lcs=tab:⇥\ 
set list!

" terminal escape sequences must be typed quickly, to make ^[O bearable
set timeout timeoutlen=5000 ttimeoutlen=100

" comments are dark green as nature intended, instead of bright cyan
hi Comment ctermfg=DarkGreen

