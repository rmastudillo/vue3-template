source $HOME/.profile
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fino"
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 30

COMPLETION_WAITING_DOTS="true"

plugins=(
    git  # aliases ( g | ga | gaa | gb | gpristine grh | grhh | gco | gf | gp | gpu | gst | gsh ... )
    dirhistory  # alt + arrow to navigate
    cp  # cpv ==> runs rsync equivalent
    command-not-found  # Shows where to find the package if not found
    gh # git completion
    node
    history
    yarn
    zsh-autosuggestions
    zsh-syntax-highlighting
)


source $ZSH/oh-my-zsh.sh

# User configuration
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='micro'
fi

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias cls="clear"
alias upd="sudo apt update ; sudo apt upgrade -y"

alias config="micro $HOME/.zshrc"
source ${HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

ZSH_HIGHLIGHT_MAXLENGTH=1024
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line regexp root)
ZSH_HIGHLIGHT_STYLES[cursor]='fg=standout,bg=standout'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=086'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=086'
ZSH_HIGHLIGHT_STYLES[path]='fg=white,italic'
ZSH_HIGHLIGHT_STYLES[command-substitution]='none'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=magenta'
