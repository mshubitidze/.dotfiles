# Disable greeting
set fish_greeting

# Set Editor to neovim
set -gx EDITOR nvim

# Set neovim as the program to open manpages
set -gx MANPAGER 'nvim +Man!'

# `theme` generates the selected bat dark/light pair here. bat reads the file
# on every invocation, so existing shells never retain stale theme variables.
set -gx BAT_CONFIG_PATH ~/.cache/theme/bat.conf

# >>> grok installer >>>
fish_add_path $HOME/.grok/bin
# <<< grok installer <<<

# Pi
fish_add_path "/Users/misho/.local/share/fnm/node-versions/v24.13.0/installation/bin"

# Android SDK (local Expo / React Native builds: expo run:android)
set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx ANDROID_SDK_ROOT $ANDROID_HOME
fish_add_path $ANDROID_HOME/platform-tools $ANDROID_HOME/emulator
