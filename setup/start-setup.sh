sudo apt-get update
sudo apt-add-repository --yes --update ppa:ansible/ansible

sudo apt-get install --yes software-properties-common git ansible

git clone https://github.com/vlad-tymoshchyk/dotfiles.git

~/dotfiles/setup/run-ansible
