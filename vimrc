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

" github.com/junegunn/fzf.vim
" github.com/gruvbox-community/gruvbox.git
if has("mac")
  set runtimepath+=/opt/homebrew/opt/fzf
else
  set runtimepath+=~/.fzf
endif
nnoremap <C-p> :Files<CR>
nnoremap <C-j> :RG<CR>

" github.com/lervag/vimtex.git
let g:vimtex_imaps_enabled = 0
let g:vimtex_matchparen_enabled = 0
let g:vimtex_view_method = has("mac") ? "skim" : "zathura"
au FileType tex setlocal indentexpr=

packadd! matchit
let g:netrw_banner=0         " netrw: no banner
let g:netrw_liststyle=3      " netrw: tree view

" vim-redprl, vim-redtt
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
au BufNewFile,BufRead *.lagda setf agda                  " literate Agda

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

" mvim/gvim-specific settings
au GuiEnter * set belloff=all
set guioptions-=m
set guioptions-=r
set guioptions-=T
set guioptions-=L
if has("gui_running")
  set background=light
  colorscheme gruvbox
  if has("mac")
    set guifont=PragmataPro\ Mono:h16
  else
    set guifont=PragmataPro\ Mono\ 13
  endif
  let g:terminal_ansi_colors = [
    \'#282828', '#CC241D', '#98971A', '#D79921',
    \'#458588', '#B16286', '#689D6A', '#D65D0E',
    \'#fb4934', '#b8bb26', '#fabd2f', '#83a598',
    \'#d3869b', '#8ec07c', '#fe8019', '#FBF1C7' ]
  highlight Terminal guibg='#282828'
  highlight Terminal guifg='#ebdbb2'
endif

digraph NN 8469 " ℕ
digraph QQ 8474 " ℚ

" Beamer screenshots: Chrome print to PDF (bg graphics, no margin)
let g:html_font="PragmataPro"

" github.com/whonore/Coqtail
let g:coqtail_build_system="prefer-coqproject"
digraph +2 10815 " ⨿
digraph [[ 10214 " ⟦
digraph ]] 10215 " ⟧
function CoqtailHookDefineMappings()
  imap <buffer> <S-Down> <Plug>CoqNext
  imap <buffer> <S-Left> <Plug>CoqToLine
  imap <buffer> <S-Up> <Plug>CoqUndo
  nmap <buffer> <S-Down> <Plug>CoqNext
  nmap <buffer> <S-Left> <Plug>CoqToLine
  nmap <buffer> <S-Up> <Plug>CoqUndo
endfunction
