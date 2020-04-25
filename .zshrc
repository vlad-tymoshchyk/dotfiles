# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="agnoster"
# ZSH_THEME="awesomepanda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git web-search vi-mode jump)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

hash -d                projects=~/projects

hash -d                      wj=~projects/wj

hash -d                     wjw=~wj/workjam-web
hash -d                    wjw1=~wj/workjam-web-1
hash -d                    wjw2=~wj/workjam-web-2

hash -d                   wjsrc=~wjw/src
hash -d                   wjapp=~wjsrc/app
hash -d                    wjv2=~wjsrc/v2
hash -d                 wjstore=~wjv2/store
hash -d                   wjapi=~wjv2/api
hash -d                   wjcom=~wjv2/components

hash -d                     wja=~wj/wj-web-app
hash -d                    wja1=~wj/wj-web-app-1
hash -d                   wjdoc=~wj/workjam-api-documentation

hash -d                dotfiles=~/dotfiles
hash -d                     dot=~dotfiles
hash -d              tmuxinator=~dotfiles/tmuxinator
hash -d                 sandbox=~/sandbox
hash -d               sandboxes=~/sandboxes
hash -d                  github=~/github
hash -d                   books=~/books
hash -d                  master=~/master-thesis
hash -d               downloads=~/Downloads
hash -d                packages=~/.packages
hash -d                codewars=~/codewars
hash -d                projects=~/projects

alias vimrc="nvim ~dot/.vimrc"
alias bashrc="nvim ~dot/.bashrc"
alias zshrc="nvim ~dot/.zshrc && source ~dot/.zshrc"
alias tmuxconf="nvim ~dot/.tmux.conf"
alias gitconfig="nvim ~dot/.gitconfig"
alias i3config="nvim ~dot/i3/config"
alias i3blocksconf="nvim ~dot/i3blocks/config"
alias installconf="nvim ~dot/install.sh"

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

set -g mouse on

bindkey jk vi-cmd-mode

# [[ $TERM != "screen" ]] && exec tmux

alias -s {txt,js,jsx,ts,tsx}=nvim
alias -s {uml,yaml}=vim

# zle -N exit exit
# bindkey ^q exit

# alias rbook="ls ~/books | dmenu -i -l 30 | xargs -I{} zathura ~/books/{}"

export PATH=$HOME/dotfiles/utils:$HOME/manually-installed-packages/**/bin:$PATH

alias fcd="cd \$(ls -R | grep "^\./" | fzf | awk -F'[:]' '{print $1}')"
alias lee="leetcode"
alias mux="tmuxinator"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source ~/.config/broot/launcher/bash/br

bindkey -s '^b' 'br\n'
# bindkey -s '^h' 'htop\n'

export EDITOR=/usr/bin/nvim

mkdircd () {
  mkdir -p -- "$1" && cd -P -- "$1"
}

alias setxkb="setxkbmap -query; setxkbmap -option; setxkbmap -layout us,ua; setxkbmap -option grp:win_space_toggle; echo ---; setxkbmap -query"

aptse() {
  if [ -n "$1" ];
  then
    apt search "^$1$"
  fi
}

# git command for getting short summary on files which the branches are different in
# git diff TR-3151 --raw | sed 's/\s/ /g'| grep '[A-Z]\s*src/.*$' -o
alias zshreload="source ~/.zshrc"

alias netstorm="wine ~/.wine/drive_c/Program\\ Files\\ \(x86\)/Netstorm\\ Islands\\ at\\ War/package/Netstorm.exe"
alias vi="nvim \"+set nonumber\""

alias rn="ranger"

alias soundloopon="pactl load-module module-loopback latency_msec=1"
alias soundloopoff="pactl unload-module module-loopback"
alias z="zathura"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# source ~/powerlevel10k/powerlevel10k.zsh-theme
