clear

if [ ! -z $(command -v pacman) ]; then
	MNG="pacman -S"
else
	MNG="apt-get install"
fi

programms_to_install=(
	vim
	tmux
	zsh
	nvim
	git
	tig
	zathura
)

files_to_create=(
	~/.vimrc
	~/.zshrc
	~/.gitconfig
	~/.config/i3/config
)

for i in "${programms_to_install[@]}"
do
	if [ ! -z $(command -v $i) ]; then
		echo "ALREADY EXISTS: $i"
	else
 		echo "$i INSTALLING";
		sudo ${MNG} $i -y
	fi
done
