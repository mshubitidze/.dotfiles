export ZSH="$HOME/.oh-my-zsh"

export MANPAGER="nvim +Man!"
export MANWIDTH=999
source ~/.anthropic_api_key
# ZSH_THEME="refined"

# plugins=(
# 	zsh-syntax-highlighting
# 	zsh-autosuggestions
# 	zsh-vi-mode
# )

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
source $ZSH/oh-my-zsh.sh

export COREPACK_ENABLE_AUTO_PIN=0

export EDITOR="nvim"

alias cat="bat"

alias v="nvim"
alias c="clear"
alias s="source ~/.zshrc"

alias ave="ansible-vault encrypt"
alias avd="ansible-vault decrypt"

alias dc="docker compose"

alias n="npm"
alias nx="npx"
alias pn="pnpm"
alias pnx="pnpm dlx"

alias ta="tmux attach"
alias tls="tmux ls"

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gco="git checkout"
alias gcl="git clone"
alias gd="git diff"
alias gdc="git diff --cached"
alias gb="git branch"
alias gba="git branch -a"
alias gm="git merge"
alias gma="git merge --abort"
alias glog="git log --oneline --decorate --graph"
alias gsw="git switch"
alias gfp="git fetch --prune --all"

alias ld="eza -lD"
alias lf="eza -lf --color=always | grep -v /"
alias lh="eza -dl .* --group-directories-first"
alias ll="eza -al --group-directories-first"
alias ls="eza -alf --color=always --sort=size | grep -v /"
alias lt="eza -al --sort=modified"

alias taoc="touch in.txt && touch test.txt && touch main.py"
alias aoc="python3 main.py < in.txt"
alias aot="python3 main.py < test.txt"

function create_repo() {
    gh repo create "$2" --public --source="$1" --remote=origin --push
}
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/m/.bun/_bun" ] && source "/Users/m/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(starship init zsh)"
. "/Users/m/.deno/env"

source ~/.dotfiles/catppuccin_mocha-zsh-syntax-highlighting.zsh

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source <(fzf --zsh)

. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/Users/m/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
