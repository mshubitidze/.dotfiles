# .dotfiles

# install command line tools

xcode-select --install

# homebrew

brew bundle --file ~/.dotfiles/Brewfile

# create symlinks to config files

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
...
