needs updating...

## Setup

### 1. install cli tools

### 2. install [**Brew**](https://brew.sh), git

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 3. clone this repo

```zsh
git clone git@github.com:mshubitidze/.dotfiles.git ~/
```

### 4. install [**kitty**](https://sw.kovidgoyal.net/kitty/)

```zsh
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

```

### 5. install [**alacritty**](https://alacritty.org/)

```zsh
brew install --cask alacritty
```

### 6. install zsh stuff

- [**Oh My Zsh**](https://ohmyz.sh/)
- [**Starship**](https://starship.rs/)

### 7. install [**Brewfile**](https://github.com/mshubitidze/.dotfiles/blob/main/Brewfile)

```zsh
brew bundle install
```

### 8. install neovim

[**Lunarvim**](https://www.lunarvim.org/)

```zsh
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```

[**NvChad**](https://nvchad.com/)

```zsh
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

### 9. install apps

- [**Klack**](https://tryklack.com)
- [**Quickshade**](https://apps.apple.com/us/app/quickshade/id931571202)

### 10. install [Oh my tmux](https://github.com/gpakosz/.tmux)

```zsh
git clone https://github.com/gpakosz/.tmux.git ~/
ln -s -f ~/.tmux/.tmux.conf
ln -s ~/.dotfiles/.tmux.conf.local ~/.tmux.conf.local
```

### 11. install a [**nerd font**](https://github.com/ryanoasis/nerd-fonts)

```zsh
brew install font-jetbrainsmono-nerd-font-mono
```

```zsh
brew install font-hack-nerd-font-mono
```

### 12. symlink dots

```zsh
ln -s ~/.dotfiles/.zshrc ~/.zshrc
```

```zsh
ln -s ~/.dotfiles/nvim/custom ~/.config/nvim/lua/custom
```

```zsh
ln -s ~/.dotfiles/lvim ~/.config/lvim
```

```zsh
ln -s ~/.dotfiles/kitty ~/.config/kitty
```

```zsh
ln -s ~/.dotfiles/alacritty ~/.config/alacritty
```

```zsh
ln -s ~/.dotfiles/yabai ~/.config/yabai
```

```zsh
ln -s ~/.dotfiles/skhd ~/.config/skhd
```

# n. **_do the thing..._**
