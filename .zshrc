export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export EDITOR="nvim"
export VISUAL="nvim"

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

alias toggle="~/.config/toggle-theme.sh"
alias code="code-insiders"

alias shadd="bunx shadcn-ui@latest add"

alias ave="ansible-vault encrypt"
alias avd="ansible-vault decrypt"

alias ta="tmux attach -t"
alias tls="tmux ls"

alias rm=trash

alias s="source ~/.zshrc"
alias c="clear"

alias v="nvim"

alias py3="python3"

alias cat="bat --paging never"

alias n="npm"
alias nx="npx"
alias pn="pnpm"
alias pnx="pnpx"

alias lg="lazygit"

alias g="git"
alias gs="git status"
alias gc="git commit"
alias gcl="git clone"
alias gl="git log"
alias ga="git add"
alias gch="git checkout"
alias gcb="git checkout -b"
alias gchm="git checkout main"
alias gpum="git pull upstream main"
alias gb="git branch"

alias aoc="pypy3 main.py < test.txt && pypy3 main.py < in.txt"
alias aot="pypy3 main.py < test.txt"
alias aos="pypy3 main.py < in.txt"
alias taoc="touch main.py in.txt test.txt"

alias ls="exa --git --icons"
alias l="ls -lbF --git"
alias ll="ls -la --git"
alias la="ls -lbhHigUmuSa"
alias lx="ls -lbhHigUmuSa@"
alias tree="exa --tree --git"
alias lS="exa -1"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/m/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/m/.bun/_bun" ] && source "/Users/m/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
