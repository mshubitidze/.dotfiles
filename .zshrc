# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/mikheilshubitidze/.oh-my-zsh"

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

source ~/.custom_commands.sh

# aliases
alias vim="nvim"
alias sl="ls"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias ngrok="/Applications/ngrok"

bindkey -v

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

