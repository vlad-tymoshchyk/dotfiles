private_zshrc_before="$HOME/.private.before.zshrc"
if [ -f $private_zshrc_before ]; then
  source "$private_zshrc_before"
else
  echo "...creating $private_zshrc_before"
  touch "$private_zshrc_before"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="awesomepanda"

plugins=(git z vi-mode jump colorize command-not-found)

if [[ ! $PATH == *"/dotfiles/bin"* ]]; then
  export PATH=$PATH\
:/usr/local/go/bin\
:/usr/libexec/docker/cli-plugins\
:$HOME/go/bin\
:$HOME/bin/nvim/bin\
:$HOME/.cargo/bin\
:$HOME/dotfiles/bin

# :$HOME/bin\
# :$HOME/.local/bin\
fi

# echo $PATH | sed "s/:/\n/g" | sort

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
alias ~s="cd \`git rev-parse --show-toplevel\`/src"
alias ~t="cd \`git rev-parse --show-toplevel\`/testcafe"
alias ~a="cd \`git rev-parse --show-toplevel\`/api-mock"
alias ww="which"
alias c=`which cat`
alias n="`which nvim`"
alias nu="nvim -u ~/.vimrc"
alias no="nvim  +'norm! \`0'"
alias lg="lazygit"
alias t="tmux"
alias rr="clear && r"
alias nf="file=\`fzf --height \"10%\"\`; if [ ! -z \$file ]; then nvim \$file; fi"
alias gcob="branch=\`git branch --all | fzf --height \"10%\" | xargs\`; if [ ! -z \$branch ]; then git checkout \$branch; fi"
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
alias gw="git worktree"
alias gwa="git worktree add"
alias gwr="git worktree remove"
alias gwl="git worktree list"
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
alias cal="gcal --with-week-number --starting-day=Monday --year 2022"
alias xg="xdg-open"
alias _l="exa --long --icons --all --group-directories-first --sort=ext"
alias _lt="_l --tree"
alias l="_l"
alias lt2="_lt --level=2"
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

export EDITOR=$(which nvim)
export PDF_VIEWER=$(which zathura)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

hash -d authn=~/projects/saas-authn-ui
hash -d admin=~/projects/saas-admin-ui
hash -d idls=~/projects/saas-api-idls
hash -d bizops=~/projects/saas-bizops-ui
hash -d animal=~/gl/AnimalRescue/Frontend
hash -d words=~/words

eval "$(direnv hook zsh)"

autoload -U compinit
compinit -i

git_root() {
  echo `git root`
}

git_bare_name() {
  echo `git_bare_repo | xargs basename`
}

add_worktree() {
  branch_name=$1
  repo_path=`git_bare_repo`

  if ! git rev-parse --verify "$branch_name"; then
    git branch $branch_name
  fi

  sh -c "cd $repo_path && git worktree add $branch_name"
}

switch_tmux_client() {
  session_name=$1
  branch_name=$2
  repo_path=$3

  if ! tmux has-session -t "$session_name" 2> /dev/null; then
    tmux new-session -d -s "$session_name" -c "$repo_path/$branch_name"
  fi

  if [[ -z $TMUX ]]; then
    tmux attach -t "$session_name"
  else
    tmux switch-client -t "$session_name"
  fi
}

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

pr_list() {
  echo "AUTHN"
  gh pr --repo imprivata-cloud/saas-authn-ui ls
  echo "ADMIN"
  gh pr --repo imprivata-cloud/saas-admin-ui ls
}

private_zshrc_after="$HOME/.private.after.zshrc"
if [ -f $private_zshrc_after ]; then
  source "$private_zshrc_after"
else
  echo "...creating $private_zshrc_after"
  touch "$private_zshrc_after"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}"  ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
