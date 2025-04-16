echo "#################"
echo "### git install ###"
echo "#################"
sudo pacman -S --needed git
echo "#################"
echo "### git setup ###"
echo "#################"
git config --global user.email "benedict.smit@tu-dortmund.de"
git config --global user.name "Benedict Christian Smit"
git config --global pull.rebase true
git config --global init.defaultBranch main

echo "##################"
echo "### rust setup ###"
echo "##################"
rustup default stable
rustup update

echo "##############################"
echo "### pacman-contrib install ###"
echo "##############################"
sudo pacman -S --needed pacman-contrib

echo "##################"
echo "### paru setup ###"
echo "##################"
if ! command -v paru >/dev/null 2>&1; then
  sudo pacman -S --needed base-devel 
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
  cd ..
  rm -r paru
fi

echo "#################################"
echo "### system upgrade using paru ###"
echo "#################################"
sudo paru -Syu

echo "######EEEE###########"
echo "### fonts install ###"
echo "#########EEEE########"
sudo pacman -S --needed \
  ttf-meslo-nerd \
  ttf-font-awesome \
  ttf-roboto \
  adobe-source-sans-fonts

echo "####EEE#############"
echo "### stow install ###"
echo "####################"
sudo pacman -S --needed stow

echo "###################"
echo "### zsh install ###"
echo "###################"
sudo pacman -S --needed zsh

echo "########################"
echo "### hyprland install ###"
echo "########################"
sudo pacman -S --needed \
  wayland \
  hyprland \
  wofi \
  hyprpaper \
  hyprlock \
  hypridle \
  waybar \
  pavucontrol
paru -S --needed hyprshot
echo "#####################################"
echo "### hyprland screen share install ###"
echo "#####################################"
sudo pacman -S --needed \
  pipewire \
  wireplumber \
  xdg-desktop-portal-hyprland
paru -S --needed xwaylandvideobridge
echo "###################################"
echo "### hyprland screen share setup ###"
echo "###################################"
sudo systemctl enable --now xwaylandvideobridge

echo "########################"
echo "### terminal install ###"
echo "########################"
sudo pacman -S --needed \
  alacritty \
  starship \
  tmux \
  tmuxp
if [ ! -d ~/.tmux/plugins/tpm]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "###################"
echo "### IDE install ###"
echo "###################"
sudo pacman -S --needed neovim

echo "#######################"
echo "### browser install ###"
echo "#######################"
sudo pacman -S --needed firefox

echo "##########################"
echo "### messangers install ###"
echo "##########################"
sudo pacman -S --needed \
  signal-desktop \
  telegram-desktop

echo "###########################"
echo "### typesetting install ###"
echo "###########################"
sudo pacman -S --needed \
  typst \
  texlive

echo "##############################"
echo "### terminal tools install ###"
echo "##############################"
sudo pacman -S --needed \
  ripgrep \
  bat \
  bat-extras \
  fd \
  fzf \
  lazygit \
  man \
  wl-clipboard \
  wget

echo "################################"
echo "### nodejs and tools install ###"
echo "################################"
sudo pacman -S --needed \
  nodejs \
  npm \
  pnpm \
  wasm-pack

echo "###########################"
echo "### tree sitter install ###"
echo "###########################"
sudo pacman -S --needed tree-sitter-cli
sudo npm install -g tree-sitter-cli

### printer and scanner
echo "###################################"
echo "### printer and scanner install ###"
echo "###################################"
sudo pacman -S --needed \
  sane \
  sane-airscan \
  cups
sudo systemctl enable --now cups

echo "#################"
echo "### zsh setup ###"
echo "#################"
chsh -s /bin/zsh

echo "############################"
echo "### devcontainer install ###"
echo "############################"
sudo pacman -S --needed docker
sudo npm install -g @devcontainers/cli

# echo "#################"
# echo "### i3 install ###"
# echo "#################"
# sudo pacman -S --needed \
#   i3-wm \
#   polybar \
#   picom \
#   feh \
#   rofi

