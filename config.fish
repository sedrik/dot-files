if status is-login
    and status is-interactive
    # To add a key, set -Ua SSH_KEYS_TO_AUTOLOAD keypath
    # To remove a key, set -U --erase SSH_KEYS_TO_AUTOLOAD[index_of_key]
    keychain --eval $SSH_KEYS_TO_AUTOLOAD | source
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    # sleep 1 & xmodmap ~/.Xmodmap > /dev/null
    starship init fish | source

    nvm use lts

    zoxide init --cmd cd fish | source

    source "$HOME/.cargo/env.fish"

    pyenv init - fish | source
    pyenv virtualenv-init - | source
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sedrik/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/home/sedrik/Downloads/google-cloud-sdk/path.fish.inc'
end

# opencode
fish_add_path /home/sedrik/.opencode/bin

# >>> rocm-cli path >>>
if not contains -- "$HOME/.local/bin" $PATH
    set -gx PATH "$HOME/.local/bin" $PATH
end
# <<< rocm-cli path <<<
