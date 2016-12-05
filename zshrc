export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

export UPDATE_ZSH_DAYS=7

plugins=(rails archlinux bundler encode64 systemd lol)
source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
export DOTFILES=$HOME/root/usr/local/dotfiles

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Ruby
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

# Go
export GOPATH=$HOME/root/usr/local/go
export PATH=$PATH:$GOPATH/bin

export LESS=-FRX

# npm
export PATH=~/.npm-global/bin:$PATH

##### aliases #####

# vagrant
alias vu='vagrant up --provision'
alias vp='vagrant provision'
alias vd='vagrant destroy'
alias vs='vagrant ssh'

# config
alias vimcfg='vim ~/.vimrc'
alias zshcfg='vim ~/.zshrc; source ~/.zshrc'
alias awcfg='vim ~/.config/awesome/rc.lua'

##### functions #####

# simplify cd in $GOPATH
gd () {
  if [[ $1 == '' ]]
  then
    echo 'Give me the fucking argument!'
    return 1
  fi

  BASE_DIR=$GOPATH/src/github.com/
  DIR=$(find $BASE_DIR -path \*$1 | head -n 1)

  if [ -d $DIR ]
  then
    cd $DIR
    return 0
  elif [ -f $DIR ]
  then
    echo "Can't cd to the $1: is a file. Do you want to edit it with $EDITOR?"
    read -p "\b" yn
    case $yn in
      [Yy]* ) $($EDITOR < `tty` > `tty` $DIR);;
      [Nn]* ) return 0;;
      * ) $($EDITOR < `tty` > `tty` $DIR);;
    esac
  else
    echo "Can not find $1 in \$GOPATH"
    return 1
  fi
}
# end gd()

export PATH=$PATH:$HOME/root/bin

# sudo
alias sc='sudo systemctl'
alias pm='sudo pacman'

clr () {
  echo 'Clearing mem in background...'
  for i in {1..5}
  do
    sudo bash -c 'echo 3 > /proc/sys/vm/drop_caches; sync'
  done &
}

if hash pygmentize 2>/dev/null; then
  alias cat="pygmentize -O style=monokai -f console256 -g"
fi
