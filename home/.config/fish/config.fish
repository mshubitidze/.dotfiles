# Disable greeting
set fish_greeting

# Set Editor to neovim
set -gx EDITOR nvim

# Set neovim as the program to open manpages
set -gx MANPAGER 'nvim +Man!'

# >>> grok installer >>>
fish_add_path $HOME/.grok/bin
# <<< grok installer <<<

# Pi
fish_add_path "/Users/misho/.local/share/fnm/node-versions/v24.13.0/installation/bin"
