# Setup

## install command line tools

```shell
xcode-select --install
```

## create symlinks to config files

```shell
ls -s ~/.dotfiles/Brefile ~/Brewfile
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.custom_commands.sh ~/.custom_commands.sh
```

## Homebrew

```shell
brew bundle --file ~/Brewfile
```

## Vim

### vim-plug (nvim)

```shell
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
