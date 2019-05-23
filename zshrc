# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

setopt nullglob

# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias objdumpi='objdump -Mintel_syntax'
alias scheme='petite'
alias emacs='emacs -nw'
alias sl='sl -e'
alias gvim="gvim 2>/dev/null"

# environment
PROMPT='%n@%m:%~$ '
export PAGER=less
export EDITOR=vim

export PATH=~/.cabal/bin:$PATH
export PATH=/usr/racket/bin:$PATH
export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH

# functions
# other afs incantations: fs sa, fs la
# aklog club.cc.cmu.edu
sigbovik () {
  aklog club.cc.cmu.edu && pushd /afs/club.cc.cmu.edu/user/bovik/www/sigbovik
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'
