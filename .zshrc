# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
if (uname | grep -qE "Darwin|BSD"); then
    alias ls="ls -FG"
else
    alias ls="ls --color=auto -F"
fi
alias view="vim -R"
#export TERM=xterm-256color
export EDITOR="vim"
alias tmux="env TERM=xterm-256color tmux"

# emacs
EMACS_ENV="TERM=xterm-256color"
#if (uname | grep -qE "Darwin"); then
#    EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
#    EMACSCLIENT="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
#else
#    EMACS=$(which emacs)
#    EMACSCLIENT=$(which emacsclient)
#fi
EMACS=$(which emacs)
EMACSCLIENT=$(which emacsclient)
alias emacs="env $EMACS_ENV $EMACS"
alias e="env $EMACS_ENV $EMACSCLIENT -t"
alias ec="env $EMACS_ENV $EMACSCLIENT -c"

function emacsd {
    case "$1" in
        start)
            env $EMACS_ENV $EMACS --daemon
            ;;
        stop)
            $EMACSCLIENT -e "(kill-emacs)"
            ;;
        restart)
            emacsd stop && emacsd start
            ;;
        *)
            echo "usage: emacsd [ start | stop | restart ]"
            ;;
    esac
}

# todo.txt
source "$HOME/tools/opt/todo.txt-cli/todo_completion"
alias t="$HOME/tools/opt/todo.txt-cli/todo.sh -d $HOME/.config/todo.cfg"

# Python
#export PYTHONSTARTUP=$HOME/.pystartup.py

# Ruby
#export PATH=$HOME/.gem/ruby/2.0.0/bin:$PATH

# Clojure
#LOADER_JAR=$HOME/hello-clojure/script-loader/target/uberjar/script-loader-0.1.0-SNAPSHOT-standalone.jar
#function clj {
#  java -Dfile.encoding=UTF-8 -jar $LOADER_JAR $@
#}
