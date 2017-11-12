# fish git prompt
# set __fish_git_prompt_showdirtystate 'yes'
# set __fish_git_prompt_showstashstate 'yes'
# set __fish_git_prompt_showupstream 'yes'
# set __fish_git_prompt_color_branch yellow

# Status Chars
# set __fish_git_prompt_char_dirtystate '⚡'
# set __fish_git_prompt_char_stagedstate '→'
# set __fish_git_prompt_char_stashstate '↩'
# set __fish_git_prompt_char_upstream_ahead '↑'
# set __fish_git_prompt_char_upstream_behind '↓'

# Fish virtualenv
eval (python -m virtualfish)

# No caps..
setxkbmap -layout se -option ctrl:nocaps

# function fish_prompt
#         if set -q VIRTUAL_ENV
#             echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
#         end
#         set last_status $status
#         set_color $fish_color_cwd
#         printf '%s' (prompt_pwd)
#         set_color normal
#         printf '%s ' (__fish_git_prompt)
#        set_color normal
# end

# Setup path
set PATH  ~/.cargo/bin/ ~/.bin $PATH

set -x PIP_REQUIRE_VIRTUALENV true
