#           _              
#          | |             
#   _______| |__  _ __ ___ 
#  |_  / __| '_ \| '__/ __|
#   / /\__ \ | | | | | (__ 
#  /___|___/_| |_|_|  \___|
# 
# 


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

# History.
HIST_STAMPS="yyyy-mm-dd"

# Plugins.
plugins=(
  git
  copypath
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#Editor.
export EDITOR="nvim"


#nunununununununununununu
#        Aliases
#nunununununununununununu

# Config.
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# Navigation.
alias ..="cd .."
alias ...="cd ../.."
alias -- -="cd -"
alias ~="cd ~"

# Report.
alias ls="ls -Fh --color=auto --group-directories-first"
alias la="ls -a"
alias ll="ls -alF"
alias grep="grep --color=auto"

# Dotfiles.
alias dot="/mingw64/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# Bookmarks.
alias cdl='cd ~/Downloads && ls -lA'
alias cdoc='cd ~/Documents && ls -lA'
alias cdev='cd D:/Development && ls -lA'
alias cdc='cd C:/ && ls -lA'
alias cdd='cd D:/ && ls -lA'

# Shortcuts.
alias c='clear'
alias e='exit'

# Developer shortcuts.
alias g='git'
alias v='nvim'

# jq settings (https://stedolan.github.io/jq/)
alias jq="C:/Program\ Files/Git/bin/jq.exe"

#nunununununununununununu
#      FUNCTIONS 
#nunununununununununununu

# Create a new directory and enter it
mkd() {
    mkdir -p "$@" && cd "$@"
}

# Git commit browser
fshow() {
    local commit_hash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
    local view_commit="$commit_hash | xargs -I % sh -c 'git show --color=always %'"
    git log --color=always \
        --format="%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" "$@" | \
    fzf --no-sort --tiebreak=index --no-multi --reverse --ansi \
        --header="enter to view, alt-y to copy hash" --preview="$view_commit" \
        --bind="enter:execute:$view_commit | less -R" \
        --bind="alt-y:execute:$commit_hash | xclip -selection clipboard"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
