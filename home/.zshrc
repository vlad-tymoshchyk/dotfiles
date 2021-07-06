export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="awesomepanda"

plugins=(git z vi-mode jump colorize command-not-found)

source $ZSH/oh-my-zsh.sh
set -g mouse on
bindkey jk vi-cmd-mode
bindkey ^q push-line

hash -d dotfiles=~/dotfiles
hash -d sandbox=~/sandbox
hash -d sandboxes=~/sandboxes
hash -d github=~/github
hash -d books=~/books
hash -d downloads=~/Downloads
hash -d proj=~/projects
hash -d projects=~/projects
hash -d test=~/test
hash -d mux=~dotfiles/config/tmuxinator
hash -d ssh=~/.ssh
hash -d bin=~/bin
hash -d gl=~/gl
hash -d im=~/gl/im

alias ww="which"
alias n="nvim"
alias c="cd"
alias vimrc="nvim ~/.vimrc"
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
alias rn="ranger"
alias cal="gcal --with-week-number --starting-day=Monday --year 2021"
alias xg="xdg-open"
alias l="ls -gah --group-directories-first"
alias ll="ls -lah"

alias proj="cd \`ls ~/projects | fzf | xargs -I{} echo ~/projects/{}\` && clear"

install-oh-my-zsh-curl() { sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" }
install-oh-my-zsh-wget() { sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" }
install-nvm-curl() { curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash }
install-nvm-wget() { wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash }

alias -s {txt,js,jsx,ts,tsx}=nvim
alias -s {uml,yaml}=nvim

export EDITOR=$(which nvim)
export PDF_VIEWER=$(which zathura)

LC_TIME=en_IN.UTF-8
export LC_TIME
export PATH=$HOME/bin:$HOME/dotfiles/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/go/bin:$PATH

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
hash -d bizops=~/projects/saas-bizops-ui
hash -d animal=~/gl/AnimalRescue/Frontend
hash -d words=~/words

eval "$(direnv hook zsh)"
