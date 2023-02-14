tick="\xE2\x9C\x94"
cross="\xE2\x9D\x8C"

# check whether git is installed
which git > /dev/null 2>&1
gitInstalled=$?

if [ $gitInstalled -eq 0 ]; then
  echo -e "${tick} Git is installed"
else 
  echo -e "${cross} Git is not installed"
fi

# check whether python3 is installed
which python3 > /dev/null 2>&1
python3Installed=$?

if [ $python3Installed -eq 0 ]; then
  echo -e "${tick} python3 is installed"
else 
  echo -e "${cross} python3 is not installed"
fi
echo ""

if [[ $gitInstalled -eq 1 || $python3Installed -eq 1 ]]; then
  read -p "Do you want to run 'apt-get update' and install git and python3 if they are not available? [Yy] " -n 1 -r

  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Running 'apt-get update'..."
    sudo apt-get update

    if [ $gitInstalled -eq 1 ]; then
      echo "Installing git..."
      sudo apt-get install -y git
    fi

    if [ $python3Installed -eq 1 ]; then
      echo "Installing python3..."
      sudo apt-get install -y python3
    fi
  else
    echo "Abort..."
    exit 0;
  fi
fi


read -p "Do you want clone dotfiles git repo? [Yy] " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Clonning dotfiles"
  git clone https://github.com/vlad-tymoshchyk/dotfiles.git
else
  echo "Abort..."
  exit 0;
fi
