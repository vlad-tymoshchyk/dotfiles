export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="awesomepanda"

plugins=(git web-search vi-mode jump)

source $ZSH/oh-my-zsh.sh
set -g mouse on
bindkey jk vi-cmd-mode

hash -d dotfiles=~/dotfiles
hash -d sandbox=~/sandbox
hash -d sandboxes=~/sandboxes
hash -d github=~/github
hash -d applications=~/applications
hash -d books=~/books
hash -d downloads=~/Downloads
hash -d projects=~/projects
hash -d test=~/test
hash -d mux=~dotfiles/tmuxinator
hash -d ssh=~/.ssh
hash -d bin=~/bin
hash -d gl=~/gl
hash -d im=~/gl/im
hash -d proto=~/prototypes
hash -d logs=~/logs

alias ww="which"
alias vimrc="nvim ~/.vimrc"
alias bashrc="nvim ~/.bashrc"
alias zshrc="nvim ~/.zshrc && source ~/.zshrc"
alias rnconfig="nvim ~/.config/ranger/rc.conf"
alias tmuxconf="nvim ~/.tmux.conf"
alias gitconfig="nvim ~/.gitconfig"
alias i3config="nvim ~/.config/i3/.i3config"
alias i3blocksconf="nvim ~/.config/i3blocks/config"

alias grepr="grep -R --exclude-dir=i18n --exclude-dir=dist --exclude-dir=node_modules"
alias grepi="grep -i"
alias grepri="grep -iR --exclude-dir=i18n --exclude-dir=dist --exclude-dir=node_modules"
alias findn="find . -name"

alias fzf="~/.fzf/bin/fzf"

alias nvimf="nvim \$(fzf)"
alias vimf="vim \$(fzf)"
alias gvimf="gvim \$(fzf)"

alias apts="apt-cache search"
alias apti="apt-get install"
alias sapti="sudo apt-get install"

alias tree1="tree -L 1"
alias tree2="tree -L 2"
alias tree3="tree -L 3"
alias tree4="tree -L 4"
alias tree5="tree -L 5"

alias mux="tmuxinator"
alias v="nvim"
alias rn="ranger"
alias z="zathura"

alias setxkb="setxkbmap -query; setxkbmap -option; setxkbmap -layout us,ua; setxkbmap -option grp:win_space_toggle; echo ---; setxkbmap -query"
# alias setxkbdvorak="setxkbmap -query; setxkbmap -option; setxkbmap -layout dvorak,ua; setxkbmap -option grp:win_space_toggle; echo ---; setxkbmap -query"

alias -s {txt,js,jsx,ts,tsx}=nvim
alias -s {uml,yaml}=nvim

export EDITOR=$(which nvim)
export PDF_VIEWER=$(which zathura)

LC_TIME=en_IN.UTF-8
export LC_TIME
export PATH=$HOME/bin:$HOME/dotfiles/bin:$HOME/.local/bin:$PATH

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}"  ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

tmux has -t default 2>/dev/null
if [ $? -ne 0 ]
then
  tmux new-session -s default -d
fi

notes () {
  tmux has -t notes 2>/dev/null
  if [ $? -ne 0 ]; then
    tmux new -s notes -d
    tmux send-keys -t notes "nvim ~/notes && exit" C-m
  fi
  tmux at -t notes
}

cheat() {
  curl cheat.sh/$1
}

mkcd() {
  mkdir $1 && cd $1
}

alias l="ls -gah"
alias ll="ls -lah"

hash -d ossui=~/gl/im/oss-user-demo-ui
hash -d ossspa=~/gl/im/oss-user-demo-spa-ui
hash -d saas=~/gl/im/saas-authn-webapp
hash -d animal=~/gl/AnimalRescue/Frontend
hash -d words=~/words

gs() {
  echo "Dont launch GHostScript"
}

alias nv="nvim ."
alias st="git status"

alias mcal="gcal --with-week-number --starting-day=Monday"
