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
)

for i in ${APT_PACKAGES[@]}
do
  if [[ ! -x $(command -v $i) ]];
  then
    echo "Installing $i..."
  else
    echo "Already installed: $i... Trying to update..."
  fi
  sudo apt install $i --assume-yes
done

sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install alacritty --assume-yes

# sudo apt install --assume-yes

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
