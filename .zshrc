export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="tonotdo"
plugins=(gitfast python pip zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Vim as editor
export EDITOR=vim
export VISUAL=vim

# LS_COLORS
source /home/simon/.local/share/lscolors.sh

# History
HISTSIZE=100000
SAVEHIST=50000
HISTORY_IGNORE="(ls|ls *|ll|ll *|cd|cd *|mkdir|pwd|exit|clear|history)"

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi

# Functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
if [ -f ~/.bash_functions_local ]; then
    . ~/.bash_functions_local
fi
