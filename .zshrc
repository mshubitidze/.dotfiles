if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/msh/.oh-my-zsh"

export FZF_DEFAULT_COMMAND='fd --type f'

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
alias ohmyzsh="vim ~/.oh-my-zsh"
alias sl="ls"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias tmuxcfg="vim ~/.tmux.conf.local"

bindkey -v

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
