# Setup

## install command line tools

```shell
xcode-select --install
```

## Homebrew

```shell
brew bundle --file ~/.dotfiles/Brewfile
```

## create symlinks to config files

```shell
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
```
## Vim

### vim-plug (nvim)

```shell
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

