#!/bin/zsh

dark_name="tokyonight-night"
light_name="tokyonight-day"

toggle_theme() {
    mode="$1"
    night_start=$(grep -n "${dark_name}" ~/.dotfiles/.tmux.conf.local | cut -d ':' -f 1)
    night_end=$((night_start + 17))
    day_start=$(grep -n "${light_name}" ~/.dotfiles/.tmux.conf.local | cut -d ':' -f 1)
    day_end=$((day_start + 17))

    case "$mode" in
        "day")
            to_comment="${night_start},${night_end}"
            to_uncomment="${day_start},${day_end}"
            lvim_from="$dark_name"
            lvim_to="$light_name"
            ;;
        "night")
            to_comment="${day_start},${day_end}"
            to_uncomment="${night_start},${night_end}"
            lvim_from="$light_name"
            lvim_to="$dark_name"
            ;;
        *)
          echo "Invalid theme mode: $mode (day | night)"
            exit 1
            ;;
    esac

    sed -i.bak "${to_comment}s|^|# |; ${to_uncomment}s|# ||" ~/.dotfiles/.tmux.conf.local
    sed -i.bak "s|${lvim_from}|${lvim_to}|g" ~/.config/lvim/config.lua
    kitty +kitten themes --reload-in=all tokyo night "$1"
    tmux run '"$TMUX_PROGRAM" ${TMUX_SOCKET:+-S "$TMUX_SOCKET"} source "$TMUX_CONF"'
}

os_dark=$(osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode')

if [ "$1" ]; then
    toggle_theme "$1"
    exit 1
fi

if grep -E -q "# # ${dark_name}" ~/.tmux.conf.local; then
    term_dark="false"
else
    term_dark="true"
fi

if [ "$os_dark" = "true" ] && [ "$term_dark" = "false" ]; then
    toggle_theme night
elif [ "$os_dark" = "false" ] && [ "$term_dark" = "true" ]; then
    toggle_theme day
fi

exit 1
