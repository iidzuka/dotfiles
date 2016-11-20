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

#git
source `brew --prefix git`/etc/bash_completion.d/git-completion.bash
source `brew --prefix git`/etc/bash_completion.d/git-prompt.sh

# brew instal bash-completion のための設定
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi


if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  export PS1='[ \h:\w\[\e[0m\] ]\[\e[0;31m\]$(__git_ps1)\[\e[0m\] \$ \n'
else
  export PS1='[ \[\e[32m\]\u@\h:\w\[\e[0m\]] \$ \n'
fi
function static_httpd {
  if type plackup > /dev/null; then
    plackup -MPlack::App::Directory -e 'Plack::App::Directory->new(root => ".")->to_app'
  elif type ruby > /dev/null; then
    if ruby -v | grep -qm1 'ruby 2\.'; then
      ruby -run -e httpd -- --port=5000 .
    else
      ruby -rwebrick -e 'WEBrick::HTTPServer.new(:Port => 5000, :DocumentRoot => ".").start'
    fi
  elif type python > /dev/null; then
    if python -V 2>&1 | grep -qm1 'Python 3\.'; then
      python -m http.server 5000
    else
      python -m SimpleHTTPServer 5000
    fi
  elif type node > /dev/null; then
    node -e "var c=require('connect'), d=process.env.PWD; c().use(c.logger()).use(c.static(d)).use(c.directory(d)).listen(5000);"
  elif type php > /dev/null && php -v | grep -qm1 'PHP 5\.[45]\.'; then
    php -S 0.0.0.0:5000
  elif type erl > /dev/null; then
    erl -eval 'inets:start(), inets:start(httpd, [{server_name, "httpd"}, {server_root, "."}, {document_root, "."}, {port, 5000}])'
  fi
}

#nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=./node_modules/.bin:$PATH

export NVM_DIR="/Users/hiyoshi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
