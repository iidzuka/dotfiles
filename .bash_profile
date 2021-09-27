if [ -f ~/.bashrc ];then
  . ~/.bashrc
fi
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"

eval "$(anyenv init -)"
eval "$(direnv hook bash)"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
