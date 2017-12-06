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
filetype indent on           " use filetype-specific indentation
filetype plugin on           " use filetype-specific plugins

" bindings
nmap <F5> :make!<CR><CR><CR>
nnoremap <C-L> :nohlsearch<CR><C-L>

packadd! matchit
let g:netrw_banner=0         " netrw: no banner
let g:netrw_liststyle=3      " netrw: tree view
let g:redprl_path = $HOME . '/sml-redprl/bin/redprl'
au FileType redprl nnoremap <F5> :RedPRL<CR>

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
function! TexSettings()
  if (v:version < 800)
    if !(filereadable('Makefile') || filereadable('makefile'))
      setlocal makeprg=pdflatex\ %
    endif
  else
    nmap <buffer> <F5> :call AsyncCmd('make')<CR>
  end
  setlocal indentexpr=
endfunction

" text objects for inline math
onoremap <silent> a$ :<C-u>normal F$vf$<CR>
onoremap <silent> i$ :<C-u>normal T$vt$<CR>

" gvim-specific settings
au GuiEnter * set belloff=all
set guioptions-=m
set guioptions-=r
set guioptions-=T
set guioptions-=L
if has("gui_running")
  colorscheme solarized
endif

" vim 8+: asynchronous jobs
function! AsyncCmd(cmd)
  if (v:version < 800 || exists('g:asyncBuf'))
    return
  endif
  let j = job_start(a:cmd, {'exit_cb': 'AsyncCmdExit',
    \'out_io': 'buffer','out_msg': 0})
  let g:asyncBuf = ch_getbufnr(j, 'out')
endfunction

function! AsyncCmdExit(j,status)
  if (a:status)
    execute 'botright 10 split +buffer'.g:asyncBuf
    normal G
  else
    execute 'bwipeout '.g:asyncBuf
  endif
  echo 'Exited with status '.a:status
  unlet g:asyncBuf
endfunction
