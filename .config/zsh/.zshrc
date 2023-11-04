export PATH=$PATH:$HOME/.local/bin:$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$HOME/.composer/vendor/bin:$HOME/KUHdo/flutter/bin

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(op completion zsh)"
eval "$(gh completion -s zsh)"

export EDITOR="nvim"

alias ls="exa"
alias la="ls -la"
alias ll="ls -ll"
alias lan="ls -lan"

alias vim="nvim"
alias vimdiff="nvim -d"
alias v="vim"
alias vi="vim"
alias f="yazi"
alias gui="lazygit"
alias ghd="gh dash"

alias copy="pbcopy"
alias top="btm"

alias sail="[ -f sail ] && sh sail || sh vendor/bin/sail"
alias s="sail"
alias sud="sail up -d"
alias sd="sail down"
alias sc="sail composer"
alias sa="sail artisan"
alias sao="sail artisan optimize"
alias sar="sail artisan route:list"
alias sat="sail artisan tinker"
alias ss="sail artisanil shell"
alias tinker="sail artisan tinker"
alias sacc="sail artisan cache:clear"

alias dot="/usr/bin/git --git-dir=$HOME/Repos/dotfiles/ --work-tree=$HOME"
alias dotui="lazygit --git-dir=$HOME/Repos/dotfiles --work-tree=$HOME"

