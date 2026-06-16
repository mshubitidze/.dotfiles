function lazygit --description 'lazygit, themed by $THEME_FAMILY + macOS appearance'
    set -l dir "$HOME/Library/Application Support/lazygit"
    set -l family rose-pine
    set -q THEME_FAMILY; and set family $THEME_FAMILY
    set -l variant light
    if defaults read -g AppleInterfaceStyle 2>/dev/null | string match -q Dark
        set variant dark
    end
    set -l overlay "$dir/themes/$family-$variant.yml"
    if test -f "$overlay"
        LG_CONFIG_FILE="$dir/config.yml,$overlay" command lazygit $argv
    else
        command lazygit $argv
    end
end
