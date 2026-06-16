function theme --description 'Theme family (rose-pine|catppuccin); no arg = re-sync to current state'
    set -l family rose-pine
    set -q THEME_FAMILY; and set family $THEME_FAMILY
    if set -q argv[1]
        if not contains -- $argv[1] rose-pine catppuccin
            echo "usage: theme [rose-pine|catppuccin]   (current: $family)"
            return 1
        end
        set family $argv[1]
    end
    set -Ux THEME_FAMILY $family

    set -l variant light
    if defaults read -g AppleInterfaceStyle 2>/dev/null | string match -q Dark
        set variant dark
    end

    switch $family
        case rose-pine
            sed -i '' -E 's|^theme = .*|theme = dark:Rose Pine,light:Rose Pine Dawn|' ~/.config/ghostty/config
        case catppuccin
            sed -i '' -E 's|^theme = .*|theme = dark:Catppuccin Macchiato,light:Catppuccin Latte|' ~/.config/ghostty/config
    end
    killall -USR2 ghostty 2>/dev/null # reload; or Cmd+Shift+, in Ghostty

    switch $family
        case rose-pine
            sed -i '' -E 's|^--theme-dark=.*|--theme-dark="rose-pine"|; s|^--theme-light=.*|--theme-light="rose-pine-dawn"|' ~/.config/bat/config
        case catppuccin
            sed -i '' -E 's|^--theme-dark=.*|--theme-dark="Catppuccin Macchiato"|; s|^--theme-light=.*|--theme-light="Catppuccin Latte"|' ~/.config/bat/config
    end

    # herdr has no appearance detection: set the variant explicitly, then reload.
    # path resolve → sed edits the repo file, not the stow symlink.
    set -l herdr_theme
    switch $family
        case rose-pine
            test $variant = dark; and set herdr_theme rose-pine; or set herdr_theme rose-pine-dawn
        case catppuccin
            test $variant = dark; and set herdr_theme catppuccin; or set herdr_theme catppuccin-latte
    end
    set -l hcfg (path resolve ~/.config/herdr/config.toml)
    sed -i '' -E "s|^name = \".*\"|name = \"$herdr_theme\"|" $hcfg
    command -q herdr; and herdr server reload-config >/dev/null 2>&1

    echo "theme → $family · $variant"
    echo "  ghostty · git · lazygit · bat · herdr synced; nvim live"
    echo "  (re-run 'theme' after a macOS light/dark toggle to re-sync herdr)"
end
