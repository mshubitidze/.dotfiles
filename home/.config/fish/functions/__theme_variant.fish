function __theme_variant --description 'Current appearance (dark|light) from macOS'
    if defaults read -g AppleInterfaceStyle 2>/dev/null | string match -q Dark
        echo dark
    else
        echo light
    end
end
