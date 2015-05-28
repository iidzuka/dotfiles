alias ls='ls -h'
alias ll='ls -l'
alias la='ls -a'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias cl='clear'
alias grep='grep --color'
alias vi='vim'

export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
PS1='[\u \W]\$ '

#git
source `brew --prefix git`/etc/bash_completion.d/git-completion.bash
source `brew --prefix git`/etc/bash_completion.d/git-prompt.sh

# brew instal bash-completion のための設定
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi


