# Path to your oh-my-zsh installation.
if (( ${+ZSH} )); then
else
  if [ -d "$HOME/.config/zsh/ohmyzsh/" ]; then
    export ZSH="$HOME/.config/zsh/ohmyzsh"
  else
    export ZSH="$HOME/.oh-my-zsh"
  fi
fi

ZSH_THEME=af-magic

plugins=(
  thefuck
  zsh-autosuggestions
  zsh-syntax-highlighting
  #zellij
  # tmux
)
# ZSH_TMUX_AUTOSTART=true
# ZSH_TMUX_AUTOCONNECT=false

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

alias please='sudo $(fc -ln -1)'

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1


zle -N zle-line-init
zle -N zle-keymap-select

export sourcesDir=$HOME/sources
export localConfig=$sourcesDir/localdefault.sh
if [ ! -e "$localConfig" ]; then
  mkdir -p $sourcesDir
  touch $localConfig
fi
if [ -e "$localConfig" ]; then
  source $HOME/sources/localdefault.sh
fi

export PATH="$HOME/.cargo/bin:$HOME/.local/share/nvim/mason/bin:/opt/homebrew/bin:$PATH"

eval $(thefuck --alias)
PATH=$HOME/.local/share/nvim/mason/bin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export FZF_DEFAULT_OPTS="--style full --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}' --bind 'enter:become(nvim {})'"

eval "$(tv init zsh)"
