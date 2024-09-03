# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Primer Dark Dimmed scheme by Jimmy Lin

function base16-primer-dark-dimmed -d "base16 Primer Dark Dimmed theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "1c/21/28" # Base 00 - Black
    set color01 "f4/70/67" # Base 08 - Red
    set color02 "57/ab/5a" # Base 0B - Green
    set color03 "c6/90/26" # Base 0A - Yellow
    set color04 "53/9b/f5" # Base 0D - Blue
    set color05 "e2/75/ad" # Base 0E - Magenta
    set color06 "96/d0/ff" # Base 0C - Cyan
    set color07 "90/9d/ab" # Base 05 - White
    set color08 "54/5d/68" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "cd/d9/e5" # Base 07 - Bright White
    set color16 "e0/82/3d" # Base 09
    set color17 "ae/56/22" # Base 0F
    set color18 "37/3e/47" # Base 01
    set color19 "44/4c/56" # Base 02
    set color20 "76/83/90" # Base 04
    set color21 "ad/ba/c7" # Base 06
    set color_foreground "90/9d/ab" # Base 05
    set color_background "1c/21/28" # Base 00

    # 16 color space
    __put_template 0  $color00
    __put_template 1  $color01
    __put_template 2  $color02
    __put_template 3  $color03
    __put_template 4  $color04
    __put_template 5  $color05
    __put_template 6  $color06
    __put_template 7  $color07
    __put_template 8  $color08
    __put_template 9  $color09
    __put_template 10 $color10
    __put_template 11 $color11
    __put_template 12 $color12
    __put_template 13 $color13
    __put_template 14 $color14
    __put_template 15 $color15

    # 256 color space
    __put_template 16 $color16
    __put_template 17 $color17
    __put_template 18 $color18
    __put_template 19 $color19
    __put_template 20 $color20
    __put_template 21 $color21

    # foreground / background / cursor color
    if test -n "$ITERM_SESSION_ID"
        # iTerm2 proprietary escape codes
        __put_template_custom Pg 909dab # foreground
        __put_template_custom Ph 1c2128 # background
        __put_template_custom Pi 909dab # bold color
        __put_template_custom Pj 444c56 # selection color
        __put_template_custom Pk 909dab # selected text color
        __put_template_custom Pl 909dab # cursor
        __put_template_custom Pm 1c2128 # cursor text

    else
        __put_template_var 10 $color_foreground
        if test "$BASE16_SHELL_SET_BACKGROUND" != false
            __put_template_var 11 $color_background
            if string match -q -- '*rxvt*' $TERM
                __put_template_var 708 $color_background # internal border (rxvt)
            end
        end
        __put_template_custom 12 ";7" # cursor (reverse video)
    end

    if test -z $base16_fish_shell_disable_prompt_colors
        set -gx fish_color_normal normal
        set -gx fish_color_command "539bf5" blue
        set -gx fish_color_quote "57ab5a" green
        set -gx fish_color_redirection "c69026" yellow
        set -gx fish_color_end "96d0ff" cyan
        set -gx fish_color_error "f47067" red
        set -gx fish_color_param "adbac7" cyan
        set -gx fish_color_comment "545d68" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "909dab" white --bold --background=brblack
        set -gx fish_color_search_match "c69026" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "96d0ff" cyan
        set -gx fish_color_escape "96d0ff" cyan
        set -gx fish_color_cwd "57ab5a" green
        set -gx fish_color_cwd_root "f47067" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "545d68" brblack
        set -gx fish_color_user "57ab5a" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "c69026" yellow
        set -gx fish_pager_color_prefix "909dab" white --bold --underline
        set -gx fish_pager_color_progress "cdd9e5" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "1c" "21" "28"
    __base16_fish_shell_create_vimrc_background primer-dark-dimmed
    set -U base16_fish_theme primer-dark-dimmed

    if test -n "$_flag_t"
        set base16_colors_hex
        set padded_seq_values (seq -w 0 21)
        for seq_value in $padded_seq_values
            set -l color "color$seq_value"
            set base16_colors_hex $base16_colors_hex (string replace -a / "" $$color)
        end

        __base16_fish_shell_color_test $base16_colors_hex
    end
end
