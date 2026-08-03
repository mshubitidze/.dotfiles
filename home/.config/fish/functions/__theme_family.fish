function __theme_family --description 'Current theme family from persistent state'
    set -l family rose-pine
    if test -r ~/.config/theme/family
        set -l saved (string trim <~/.config/theme/family)
        contains -- $saved (__theme_spec families); and set family $saved
    end
    echo $family
end
