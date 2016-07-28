# Path to your oh-my-zsh installation.
export ZSH=/Users/Devin/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

#==============================
#
# General
#
#==============================

# Remove name@host from zsh theme
# (Except in ssh, which is actually pretty handy)
export DEFAULT_USER=`whoami`

export EDITOR=/Users/Devin/Applications/Atom.app
export VISUAL=/Users/Devin/Applications/Atom.app

#==============================
#
# Functions
#
#==============================

function mcd() {
  mkdir -p "$1" && cd "$1";
}

#==============================
#
# Prompt config
#
#==============================

# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  current_branch=$(git current-branch 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}"
  fi
}
setopt promptsubst
PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

#==============================
#
# Plugins
#
#==============================

plugins=(zshmarks alias-tips)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

source $HOME/.aliases
source $ZSH/oh-my-zsh.sh
