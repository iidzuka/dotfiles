alias ls='ls -h'
alias ll='ls -l'
alias la='ls -a'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias cl='clear'
alias grep='grep --color'
alias vi='vim'

export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#git
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

# brew instal bash-completion のための設定
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  export PS1='[ \u@\h:\w\[\e[0m\] ]\[\e[0;31m\]$(__git_ps1)\[\e[0m\]\n\$ '
else
  export PS1='[ \[\e[32m\]\u@\h:\w\[\e[0m\]] \$ \n'
fi
function static_httpd {
  if type plackup > /dev/null; then
    plackup -MPlack::App::Directory -e 'Plack::App::Directory->new(root => ".")->to_app'
  elif type ruby > /dev/null; then
    if ruby -v | grep -qm1 'ruby 2\.'; then
      ruby -run -e httpd -- --port=21000 .
    else
      ruby -rwebrick -e 'WEBrick::HTTPServer.new(:Port => 21000, :DocumentRoot => ".").start'
    fi
  elif type python > /dev/null; then
    if python -V 2>&1 | grep -qm1 'Python 3\.'; then
      python -m http.server 21000
    else
      python -m SimpleHTTPServer 21000
    fi
  elif type node > /dev/null; then
    node -e "var c=require('connect'), d=process.env.PWD; c().use(c.logger()).use(c.static(d)).use(c.directory(d)).listen(21000);"
  elif type php > /dev/null && php -v | grep -qm1 'PHP 5\.[45]\.'; then
    php -S 0.0.0.0:21000
  elif type erl > /dev/null; then
    erl -eval 'inets:start(), inets:start(httpd, [{server_name, "httpd"}, {server_root, "."}, {document_root, "."}, {port, 21000}])'
  fi
}

#nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=./node_modules/.bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# added by travis gem
[ -f /Users/iidzuka/.travis/travis.sh ] && source /Users/iidzuka/.travis/travis.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  export PS1='[ \u@zayin:\w\[\e[0m\] ]\[\e[0;31m\]$(__git_ps1)\[\e[0m\]\n\$ '
else
  export PS1='[ \[\e[32m\]\u@\zayin:\w\[\e[0m\]] \$ \n'
fi

eval "$(anyenv init -)"
