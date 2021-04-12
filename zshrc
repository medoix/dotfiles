#  _____    _
# |__  /___| |__  _ __ ___
#   / // __| '_ \| '__/ __|
#  / /_\__ \ | | | | | (__
# /____|___/_| |_|_|  \___|

# Show OS info when opening a new terminal
neofetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases for a few useful commands
alias mirrorUpdate='sudo reflector --latest 250 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias pacmanGhost='~/.scripts/pacman.sh'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias ip='ip -c'
alias rm='rm -i'
alias x='ranger'
alias h='htop'
alias cat='bat'

# Set Oh-My-Zsh location.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set i3Blocks Lock Script
LOCKSCRIPT="betterlockscreen -l dimblur"

# Command auto-correction.
ENABLE_CORRECTION="true"

# Command execution time stamp shown in the history command output.
HIST_STAMPS="mm/dd/yyyy"
DISABLE_LS_COLORS="true"

# Plugins to load
plugins=(
    archlinux
    colorize
    colored-man-pages
    copyfile
    docker
    docker-compose
    emacs
    git
    gitfast
    golang
    history-substring-search
    kubectl
    rust
    safe-paste
    tmux
    virtualenv
    zsh-autosuggestions
    zsh-completions
    zsh-history-substring-search
    zsh-syntax-highlighting
)

setopt HIST_IGNORE_SPACE
autoload -U compinit && compinit
[[ ! -f $ZSH/oh-my-zsh.sh ]] || source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
