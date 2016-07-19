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

export PATH=~/.smackage/bin:$PATH
export PATH=~/.cabal/bin:$PATH
export PATH=~/bin:$PATH
export PATH=/opt/local/bin:$PATH # local coq install

# functions
# other afs incantations: fs sa, fs la
# aklog club.cc.cmu.edu
sigbovik () {
  aklog club.cc.cmu.edu && pushd /afs/club.cc.cmu.edu/user/bovik/www/sigbovik
}
fliptable() {
  echo "（╯°□°）╯︵ ┻━┻"
}

