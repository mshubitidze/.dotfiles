export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"

# export EDITOR=lvim
# export VISUAL=lvim

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

alias v="lvim"

alias p3="python3"

alias cat="bat --paging never"

alias n="npm"
alias nx="npx"
alias pn="pnpm"
alias pnx="pnpx"

alias lg="lazygit"

# GIT ALIASES -----------------------------------------------------------------
alias g="git"
alias gs="git status"
alias gcm="git commit"
alias gcl="git clone"
alias gl="git log"
alias ga="git add"

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

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
