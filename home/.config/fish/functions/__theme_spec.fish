function __theme_spec --description 'Theme registry' --argument-names family key
    if test "$family" = families
        printf '%s\n' rose-pine catppuccin
        return
    end

    switch "$family:$key"
        case rose-pine:ghostty-dark
            echo 'Rose Pine'
        case rose-pine:ghostty-light
            echo 'Rose Pine Dawn'
        case rose-pine:bat-dark
            echo rose-pine
        case rose-pine:bat-light
            echo rose-pine-dawn
        case catppuccin:ghostty-dark
            echo 'Catppuccin Macchiato'
        case catppuccin:ghostty-light
            echo 'Catppuccin Latte'
        case catppuccin:bat-dark
            echo 'Catppuccin Macchiato'
        case catppuccin:bat-light
            echo 'Catppuccin Latte'
        case '*'
            return 1
    end
end
