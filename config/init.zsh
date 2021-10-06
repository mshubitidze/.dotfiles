export ZSH="/Users/msh/.oh-my-zsh"

KEYTIMEOUT=1

ZSH_THEME="powerlevel10k/powerlevel10k"

# plugins
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	)

source $ZSH/oh-my-zsh.sh

# aliases
alias vim="nvim"
alias zshconfig="vim ~/.dotfiles/config/init.zsh"
alias vimconfig="vim ~/.dotfiles/config/init.vim"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias sl="ls"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

bindkey -v
