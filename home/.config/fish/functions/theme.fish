function theme --description 'Select and synchronize a terminal theme family'
    set -l family (__theme_family)
    if set -q argv[1]
        if not contains -- $argv[1] (__theme_spec families)
            echo "usage: theme ["(string join '|' (__theme_spec families))"]   (current: $family)"
            return 1
        end
        set family $argv[1]
    end

    set -l ghostty_dark (__theme_spec $family ghostty-dark)
    set -l ghostty_light (__theme_spec $family ghostty-light)
    set -l bat_dark (__theme_spec $family bat-dark)
    set -l bat_light (__theme_spec $family bat-light)
    or return 1

    # Custom bat themes are loaded from its binary cache. Rebuild only when a
    # selected theme is missing (normally just after installing new dotfiles).
    set -l bat_themes (command bat --list-themes 2>/dev/null)
    if not contains -- $bat_dark $bat_themes; or not contains -- $bat_light $bat_themes
        command bat cache --build >/dev/null
        or begin
            echo 'theme: failed to rebuild the bat theme cache' >&2
            return 1
        end
    end

    mkdir -p ~/.cache/theme ~/.config/theme

    # Generated application config is cache, never tracked dotfile state.
    set -l ghostty_config ~/.cache/theme/ghostty.conf
    set -l ghostty_tmp "$ghostty_config.tmp.$fish_pid"
    printf 'theme = light:%s,dark:%s\n' $ghostty_light $ghostty_dark >$ghostty_tmp
    and command mv $ghostty_tmp $ghostty_config
    or return 1

    set -l bat_config ~/.cache/theme/bat.conf
    set -l bat_tmp "$bat_config.tmp.$fish_pid"
    printf '%s\n' \
        '--theme="auto:system"' \
        "--theme-dark=\"$bat_dark\"" \
        "--theme-light=\"$bat_light\"" >$bat_tmp
    and command mv $bat_tmp $bat_config
    or return 1

    # Publish the family last, after all derived configuration is ready.
    set -l state ~/.config/theme/family
    set -l state_tmp "$state.tmp.$fish_pid"
    printf '%s\n' $family >$state_tmp
    and command mv $state_tmp $state
    or return 1

    # Remove the superseded universal-variable source of truth, then reload
    # Ghostty. Ghostty and bat both handle subsequent appearance changes.
    set -eU THEME_FAMILY 2>/dev/null
    killall -USR2 ghostty 2>/dev/null

    echo "theme → $family"
end
