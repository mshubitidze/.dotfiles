function __theme_spec --description 'Theme registry' --argument-names family key
    if test "$family" = families
        printf '%s\n' rose-pine catppuccin oxocarbon
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
        case oxocarbon:ghostty-dark
            echo 'Oxocarbon Dark'
        case oxocarbon:ghostty-light
            echo 'Oxocarbon Light'
        case oxocarbon:bat-dark
            echo 'Oxocarbon Dark'
        case oxocarbon:bat-light
            echo 'Oxocarbon Light'
        case '*'
            return 1
    end
end
