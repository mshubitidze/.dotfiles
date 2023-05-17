export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"

export EDITOR="nvim"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias ave="ansible-vault encrypt"
alias avd="ansible-vault decrypt"

alias ta="tmux attach -t"
alias tls="tmux ls"

alias rm=trash

alias s="source ~/.zshrc"
alias c="clear"

alias v="nvim"
alias vi="nvim"
alias vim="nvim"

alias p3="python3"
alias pp3="pypy3"

alias cat="bat --paging never"

alias n="npm"
alias nx="npx"
alias pn="pnpm"
alias pnx="pnpx"

# GIT ALIASES -----------------------------------------------------------------
alias g="git"
alias gs="git status"
alias gc="git commit"
alias gl="git log"
alias gco="git checkout"
alias ga="git add"
alias gb="git branch"
alias gba="git branch --all"
alias gbd="git branch -D"
alias gcp="git cherry-pick"
alias gd="git diff -w"
alias gds="git diff -w --staged"
alias grs="git restore --staged"
alias gu="git reset --soft HEAD~1"
alias gpr="git remote prune origin"
alias ff="gpr && git pull --ff-only"
alias grd="git fetch origin && git rebase origin/master"
alias grc="git rebase --continue"
alias gra="git rebase --abort"

# aoc
alias aoc="python3 main.py < test.txt && python3 main.py < in.txt"
alias aot="python3 main.py < test.txt"
alias aos="python3 main.py < in.txt"
alias taoc="touch main.py in.txt test.txt"

# general use aliases 
alias ls="exa --git --icons" # just replace ls by exa and allow all other exa arguments
alias l="ls -lbF --git" #   list, size, type
alias ll="ls -la --git" # long, all
alias la="ls -lbhHigUmuSa" # all list
alias lx="ls -lbhHigUmuSa@" # all list and extended
alias tree="exa --tree --git" # tree view
alias lS="exa -1" # one column by just names

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source "$HOME/.cargo/env"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
