#!/bin/zsh

night_to_day() {
    sed -i.bak '146,163 s|^|# |; 165,182 s|# ||' ~/.dotfiles/.tmux.conf.local
    sed -i.bak 's|tokyonight-night|tokyonight-day|g' ~/.config/lvim/config.lua
    kitty +kitten themes --reload-in=all tokyo night day
    tmux run '"$TMUX_PROGRAM" ${TMUX_SOCKET:+-S "$TMUX_SOCKET"} source "$TMUX_CONF"'
}

day_to_night() {
    sed -i.bak '165,182 s|^|# |; 146,163 s|# ||' ~/.dotfiles/.tmux.conf.local
    sed -i.bak 's|tokyonight-day|tokyonight-night|g' ~/.config/lvim/config.lua
    kitty +kitten themes --reload-in=all tokyo night
    tmux run '"$TMUX_PROGRAM" ${TMUX_SOCKET:+-S "$TMUX_SOCKET"} source "$TMUX_CONF"'
}

if [ "$1" = "day" ]; then
    night_to_day
elif [ "$1" = "night" ]; then
    day_to_night
else
    theme=$(osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode')

    if grep -E -q '# # tokyonight_night' ~/.tmux.conf.local; then
        termNight="false"
    else
        termNight="true"
    fi

    if [ "$theme" = "true" ]; then
        if [ "$termNight" = "false" ]; then
            day_to_night
            exit 1
        fi
    elif [ "$termNight" = "true" ]; then
        night_to_day
        exit 1
    fi
fi
