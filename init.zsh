# p10k theme
 if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
     source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
 fi
 
KEYTIMEOUT=1

export ZSH="/Users/mikheilshubitidze/.oh-my-zsh"

export MANPAGER='less -X'
ZSH_THEME="powerlevel10k/powerlevel10k"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
	zsh-vimode-visual
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
source ~/.zsh/vi-mode/vi-mode.zsh

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias py3="python3"
alias py="python"
alias vimcfg="vim ~/.dotfiles/init.vim"

source /Users/mikheilshubitidze/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
