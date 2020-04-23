#!/bin/bash
# ===========================================
echo "INSTALLING APT PACKAGES"
# ===========================================
cd ~
sudo apt-get update

APT_PACKAGES=(
  curl
  git
  tmux
  zsh
  zathura
  apt-file
  zlib1g-dev
  libssl-dev
  libcurl4-openssl-dev
  libexpat1-dev
  inotify-tools
  tree
  nmap
  htop
  tig
  calibre
)

for i in ${APT_PACKAGES[@]}
do
if [[ ! -x $(command -v $i) ]];
then
  echo "Installing $i..."
else
  echo "Already installed: $i... Trying to update..."
fi
sudo apt install $i -y
done

sudo add-apt-repository -y ppa:mmstick77/alacritty
sudo apt install alacritty -y

# sudo apt install -y

# ===========================================
echo "CLONING DOTFILES AND CREATING SYMLINKS"
# ===========================================

# installing oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [[ ! -d ~/dotfiles ]];
then
git clone https://github.com/vlad-tymoshchyk/dotfiles
else
cd ~/dotfiles
git pull
fi

cd ~
SYMLINKS=(
.bashrc
.vimrc
.zshrc
.tmux.conf
.gitconfig
)

cd ~
for i in ${SYMLINKS[@]}
do
[[ -a ~/$i ]] && rm ~/$i
ln -s ~/dotfiles/$i
done

# =========================
echo "INSTALLING SLACK"
# =========================
if [[ ! -x $(command -v slack) ]];
then
cd ~
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
sudo apt install ./slack-desktop-*.deb -y
else
echo "...slack already installed"
fi

# =========================
echo "INSTALLING TELEGRAM"
# =========================
cd ~
sudo add-apt-repository ppa:atareao/telegram -y
sudo apt-get install telegram -y

# =========================
echo "INSTALLING NEOVIM"
# =========================
# Not finished
# curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
# chmod u+x nvim.appimage
# ./nvim.appimage

# global npm packages:
# ts-node
