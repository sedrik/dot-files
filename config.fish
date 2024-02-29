if status is-interactive
    # Commands to run in interactive sessions can go here
    # sleep 1 & xmodmap ~/.Xmodmap > /dev/null
  starship init fish | source

  if test ! -f ~/myGoogleDrive/Passwords.kdbx
      google-drive-ocamlfuse ~/myGoogleDrive &
  end

  nvm use lts

  zoxide init --cmd cd fish | source
end
