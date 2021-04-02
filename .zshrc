# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

source $HOME/.config/aliases.zsh

# vi keybindings
bindkey -v
bindkey '^R' history-incremental-search-backward
autoload -U compinit
compinit

setopt share_history

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export WORKON_HOME=./virtualenvs
export PROJECT_HOME=$HOME/Projects
source $HOME/.local/bin/virtualenvwrapper.sh

# Plugins from https://github.com/zsh-users
# autosuggestions
# source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# syntax hightlight (must be at the end of .zshrc)
# source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
