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
### 4. install alacritty via brew
```zsh
brew install --cask alacritty
```
### 5. install zsh stuff
- [**Oh My Zsh**](https://ohmyz.sh/)
- [**Starship**](https://starship.rs/)
- Maybe try [**prezto**](https://github.com/sorin-ionescu/prezto)
### 6. install [**Brewfile**](https://github.com/mshubitidze/.dotfiles/blob/main/Brewfile)
```zsh
brew bundle install
```
### 7. install neovim
[**NvChad**](https://nvchad.com/)
```zsh
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```
[**Lunarvim**](https://www.lunarvim.org/)
```zsh
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```
### 8. install apps
- [**Klack**](https://tryklack.com)
- [**Quickshade**](https://apps.apple.com/us/app/quickshade/id931571202)

### 9. install [Oh my tmux](https://github.com/gpakosz/.tmux)
```zsh
git clone https://github.com/gpakosz/.tmux.git ~/
ln -s -f ~/.tmux/.tmux.conf
ln -s ~/.dotfiles/.tmux.conf.local ~/.tmux.conf.local
```

### 9. symlink dots
```zsh
ln -s ~/.dotfiles/.zshrc ~/.zshrc
```
```zsh
ln -s ~/.dotfiles/nvim/custom ~/.config/nvim/lua/custom
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

# ***do the thing...***
