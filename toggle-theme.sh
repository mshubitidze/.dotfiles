#!/bin/zsh

theme=""
dark="nightfox"
light="dayfox"

dark_name="${dark}"
light_name="${light}"

toggle_theme() {
    mode="$1"
    night_start=$(grep -n "${dark_name}" ~/.config/tmux/tmux.conf.local | cut -d ':' -f 1)
    night_end=$((night_start + 17))
    day_start=$(grep -n "${light_name}" ~/.config/tmux/tmux.conf.local | cut -d ':' -f 1)
    day_end=$((day_start + 17))

    case "$mode" in
        "$light")
            to_comment="${night_start},${night_end}"
            to_uncomment="${day_start},${day_end}"
            vim_from="${dark_name}"
            vim_to="${light_name}"
            ;;
        "$dark")
            to_comment="${day_start},${day_end}"
            to_uncomment="${night_start},${night_end}"
            vim_from="${light_name}"
            vim_to="${dark_name}"
            ;;
        *)
            echo "Invalid theme mode: ${mode} (${light} | ${dark})"
            exit 1
            ;;
    esac

    sed -i.bak "${to_comment}s|^|# |; ${to_uncomment}s|# ||" ~/.dotfiles/.tmux.conf.local
    sed -i.bak "s|${vim_from}|${vim_to}|g" ~/.config/lvim/config.lua
    sed -i.bak "s|${vim_from}|${vim_to}|g" ~/.config/nvim/init.lua
    kitty +kitten themes --reload-in=all "${mode}"
    tmux run '"$TMUX_PROGRAM" ${TMUX_SOCKET:+-S "$TMUX_SOCKET"} source "$TMUX_CONF"'
}

os_dark=$(osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode')

if [ "$1" ]; then
    toggle_theme "$1"
    exit 1
fi

if grep -E -q "# # ${dark_name}" ~/.config/tmux/tmux.conf.local; then
    term_dark="false"
else
    term_dark="true"
fi

if [ "${os_dark}" = "true" ] && [ "${term_dark}" = "false" ]; then
    toggle_theme "${dark}"
elif [ "${os_dark}" = "false" ] && [ "${term_dark}" = "true" ]; then
    toggle_theme "${light}"
fi

exit 1
