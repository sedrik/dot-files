#!/bin/env bash

set -euo pipefail

# Ubuntu setup for new systems

press_enter() {
  read -r -p "Press enter to continue"
}

echo "Install nala (improved package manager ui)"
sudo apt install nala

echo "Update apt mirrors"
sudo nala fetch

echo "Setup git"
sudo nala install git

echo "Setup FiraCode Nerd font"
sudo nala install fonts-firacode
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts.git ~/.nerd-fonts
pushd ~/.nerd-fonts
./install.sh NerdFontsSymbolsOnly
popd
rm -rf ~/.nerd-fonts
mkdir -p ~/.config/fontconfig
# Enter this into ~/.config/fontconfig/fonts.conf or make it a dot-file and
# install it using dotbot
# <?xml version='1.0'?>
# <!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
# <fontconfig>
#     <alias>
#         <family>sans-serif</family>
#         <prefer>
#                 <family>Fira Code</family>
#                 <family>FantasqueSansMono Nerd Font</family>
#         </prefer>
#     </alias>
# </fontconfig>
fc-cache -vf

echo "Setup regolith-desktop"
wget -qO - https://regolith-desktop.org/regolith.key | gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null
echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://regolith-desktop.org/release-3_0-ubuntu-lunar-amd64 lunar main" | sudo tee /etc/apt/sources.list.d/regolith.list
sudo nala update
sudo nala install regolith-desktop regolith-session-flashback regolith-look-nord

echo "Setup Alacritty"
sudo nala install alacritty
echo "Please select alacritty as the default terminal"
sudo update-alternatives --config x-terminal-emulator
mkdir -p ~/.config/alacritty/
cp /usr/share/doc/alacritty/examples/alacritty.yml ~/.config/alacritty/
# TODO Setup The fonts

echo "Setup firefox-dev (to avoid the snap version)"
sudo nala purge firefox
sudo add-apt-repository ppa:mozillateam/firefox-next
sudo nala install firefox-dev

echo "Setup fish"
sudo add-apt-repository ppa:fish-shell/release-3
sudo nala install fish
sudo chsh -s /usr/bin/fish sedrik

echo "Setup google-drive-ocamlfuse (to sync keepassxc files)"
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo nala install google-drive-ocamlfuse

echo "Setup htop"
sudo nala install htop

echo "Setup jq"
sudo nala install jq

echo "Setup keepassxc"
sudo add-apt-repository ppa:phoerious/keepassxc
sudo nala install keepassxc

echo "Setup lm-sensors"
sudo nala install lm-sensors

echo "Setup neovim (dev version)"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo nala install neovim
fish -c "alias --save vim nvim"

echo "Setup ripgrep"
sudo nala install ripgrep

echo "Setup shellcheck"
sudo nala install shellcheck

echo "Setup unrar"
sudo nala install unrar

echo "Setup startship prompt"
sudo nala install curl
curl -sS https://starship.rs/install.sh | sh
echo "starship init fish | source" >> ~/.config/fish/config.fish

echo "Do a upgrade"
sudo nala upgrade

echo "Setup build-essential"
sudo nala install build-essential

echo "Configure all dotfiles"
./install
