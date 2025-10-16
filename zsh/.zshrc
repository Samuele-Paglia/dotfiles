autoload -Uz compinit
compinit

export HISTSIZE=10000

export SAVEHIST=10000

export HISTFILE=~/.zsh_history

setopt INC_APPEND_HISTORY

setopt HIST_IGNORE_DUPS

setopt EXTENDED_HISTORY

export GPG_TTY=$(tty)

source ~/.config/zsh/aliases

source "$(mise where http:zsh-autosuggestions)"/zsh-autosuggestions-*/zsh-autosuggestions.zsh

bindkey '\e' autosuggest-execute

source "$(mise where http:zsh-syntax-highlighting)"/zsh-syntax-highlighting-*/zsh-syntax-highlighting.zsh

eval "$(mise activate zsh)"

source <(fzf --zsh)

eval "$(starship init zsh)"

eval "$(zoxide init zsh --cmd cd)"
