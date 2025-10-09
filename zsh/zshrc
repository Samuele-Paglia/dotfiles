autoload -Uz compinit
compinit

export HISTSIZE=10000

export SAVEHIST=10000

export HISTFILE=~/.zsh_history

setopt INC_APPEND_HISTORY

setopt HIST_IGNORE_DUPS

setopt EXTENDED_HISTORY

source ~/.config/zsh/aliases

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source <(fzf --zsh)

eval "$(starship init zsh)"

eval "$(zoxide init zsh --cmd cd)"
