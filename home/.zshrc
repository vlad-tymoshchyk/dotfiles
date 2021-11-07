export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="awesomepanda"

plugins=(git z vi-mode jump colorize command-not-found)

source $ZSH/oh-my-zsh.sh
set -g mouse on
bindkey jk vi-cmd-mode
bindkey ^q push-line

hash -d dotfiles=~/dotfiles
hash -d nvim=~/dotfiles/nvim
hash -d plugged=~/.config/nvim-plugged
hash -d sandbox=~/sandbox
hash -d sandboxes=~/sandboxes
hash -d github=~/github
hash -d books=~/books
hash -d downloads=~/Downloads
hash -d docs=~/Documents
hash -d proj=~/projects
hash -d projects=~/projects
hash -d test=~/test
hash -d mux=~dotfiles/config/tmuxinator
hash -d ssh=~/.ssh
hash -d bin=~/bin
hash -d gl=~/gl
hash -d im=~/gl/im

alias ~~="cd \`git rev-parse --show-toplevel\`"
alias ww="which"
alias n="nvim"
alias nu="nvim -u ~/.vimrc"
alias no="nvim  +'norm! \`0'"
alias t="tmux"
alias nf="file=\`fzf\`; if [ ! -z \$file ]; then nvim \$file; fi"
alias c="cd"
# alias vimrc="nvim ~/.vimrc"
alias vimrc="nvim ~/.config/nvim/init.lua"
alias luainit="nvim ~/dotfiles/nvim/init.lua"
alias bashrc="nvim ~/.bashrc"
alias zshrc="nvim ~/.zshrc && source ~/.zshrc"
alias rnconfig="nvim ~/.config/ranger/rc.conf"
alias tmuxconf="nvim ~/.tmux.conf"
alias gitconfig="nvim ~/.gitconfig"
alias i3config="nvim ~/.config/i3/.i3config"
alias i3blocksconf="nvim ~/.config/i3blocks/config"
alias grepi="grep -i"
alias grepri="grep -inR"
alias grepr="grep -R -n --exclude-dir=dist --exclude-dir=node_modules --exclude-dir=coverage --exclude-dir=build --exclude=package-lock.json"
alias grepra="grep -nR"

alias apts="apt-cache search"
alias apti="apt-get install"
alias sapti="sudo apt-get install"

alias gpnv="git push --no-verify"
alias gcnv="git commit --no-verify"
alias glg="git log --pretty='%Cred%h%Creset | %s %C(cyan)[%an]%Creset %C(green)(%cr)%Creset %C(yellow)%d%Creset'"
alias glgg="git log --pretty='%Cred%h%Creset | %s %C(cyan)[%an]%Creset %C(green)(%cr)%Creset %C(yellow)%d%Creset' --graph --all"
alias gs="git status"
alias ghr="gh run"
alias ghrl="gh run list"
alias ghp="gh pr"
alias ghpl="gh pr list"

alias tree1="tree -L 1"
alias tree2="tree -L 2"
alias tree3="tree -L 3"
alias tree4="tree -L 4"
alias tree5="tree -L 5"

alias mux="tmuxinator"
alias cal="gcal --with-week-number --starting-day=Monday --year 2021"
alias xg="xdg-open"
alias _l="exa --long --icons --git --all --group-directories-first --sort=ext"
alias _lt="_l --tree"
alias l="_l"
alias lt="_lt --level=2"
alias lt3="_lt --level=3"
alias lt4="_lt --level=4"
alias lt5="_lt --level=5"

alias proj="cd \`ls ~/projects | fzf | xargs -I{} echo ~/projects/{}\` && clear"

install-oh-my-zsh-curl() { sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" }
install-oh-my-zsh-wget() { sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" }
install-nvm-curl() { curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash }
install-nvm-wget() { wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash }

alias -s {txt,js,jsx,ts,tsx}=nvim
alias -s {uml,yaml}=nvim

LC_TIME=en_IN.UTF-8
export LC_TIME
export PATH=$HOME/bin:$HOME/bin/nvim/bin:$HOME/dotfiles/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/go/bin:$PATH

export EDITOR=$(which nvim)
export PDF_VIEWER=$(which zathura)

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}"  ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

tmux has -t default 2>/dev/null
if [ $? -ne 0 ]
then
  tmux new-session -s default -d
fi

hash -d authn=~/projects/saas-authn-ui
hash -d admin=~/projects/saas-admin-ui
hash -d idls=~/projects/saas-api-idls
hash -d bizops=~/projects/saas-bizops-ui
hash -d animal=~/gl/AnimalRescue/Frontend
hash -d words=~/words

eval "$(direnv hook zsh)"

autoload -U compinit
compinit -i

# alias redoc="redoc-cli"

private_zshrc="$HOME/.private.zshrc"
if [ -f $private_zshrc ]; then
  source "$private_zshrc"
else
  touch "$private_zshrc"
fi

UPDATE_TIME=`expr 60 \* 60 \* 24`
dotfiles_dir="$HOME/dotfiles"
lastupdate_file="$dotfiles_dir/.lastupdate"
lastupdate=$(touch $lastupdate_file && cat $lastupdate_file)
[ -z $lastupdate ] && lastupdate=0
now=$(date +"%s")
difference=$(expr $now - $lastupdate)
if [ $difference -gt $UPDATE_TIME ]; then
  echo $now > $lastupdate_file
  echo "checking dotfiles..."
  git -C $dotfiles_dir fetch --all > /dev/null
  upstream=`git -C $dotfiles_dir rev-parse @{u}`
  base=`git -C $dotfiles_dir rev-parse @`
  if [ $base != $upstream ]; then
    echo "updating..."
    git -C $dotfiles_dir pull
  else
    echo "Up to date"
  fi
fi
