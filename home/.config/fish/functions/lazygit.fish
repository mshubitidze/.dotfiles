function lazygit --description 'lazygit with the current family and appearance overlay'
    set -l dir "$HOME/Library/Application Support/lazygit"
    set -l overlay "$dir/themes/"(__theme_family)-(__theme_variant)".yml"
    if test -f "$overlay"
        command lazygit --use-config-file="$dir/config.yml,$overlay" $argv
    else
        echo "lazygit: missing theme overlay: $overlay" >&2
        return 1
    end
end
