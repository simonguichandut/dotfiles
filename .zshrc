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

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/simon/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Latex installation
PATH=/usr/local/texlive/2025/bin/x86_64-linux:$PATH

# Prepend QPU name to command line prompt
# See ~/.bash_aliases
setopt prompt_subst
QPU_PROMPT_PREFIX='%K{red}%F{white}%B'
QPU_PROMPT_SUFFIX='%b%f%k'
PROMPT='${CALIBRATION_TARGET_NAME:+${QPU_PROMPT_PREFIX}QPU=${CALIBRATION_TARGET_NAME}${QPU_PROMPT_SUFFIX} }'"$PROMPT"
# QPU env
[ -f "/home/simon/codes/qcs/calibration/qpu-management/load-aliases.sh" ] && source "/home/simon/codes/qcs/calibration/qpu-management/load-aliases.sh"
