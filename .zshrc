# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/vlad/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="agnoster"

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

hash -d wj=~/wj/workjam-web
hash -d wjsrc=~/wj/workjam-web/src
hash -d wjapp=~/wj/workjam-web/src/app
hash -d wjv2=~/wj/workjam-web/src/v2
hash -d wjstore=~/wj/workjam-web/src/v2/store
hash -d wjapi=~/wj/workjam-web/src/v2/api
hash -d wjcom=~/wj/workjam-web/src/v2/components

hash -d wjdocs=~/wj/workjam-api-documentation

hash -d dotfiles=~/dotfiles
hash -d sandbox=~/sandbox
hash -d github=~/github

hash -d downloads=~/Downloads

alias vimrc="nvim ~/dotfiles/.vimrc"
alias bashrc="nvim ~/dotfiles/.bashrc"
alias zshrc="nvim ~/dotfiles/.zshrc"
alias tmuxrc="nvim ~/dotfiles/.tmux.conf"
alias i3config="nvim ~/dotfiles/i3/config"
alias i3blocks="nvim ~/dotfiles/i3blocks/config"

alias grepr="grep -R"
alias grepri="grep -iR"
alias findn="find . -name"

alias fzf="~/.fzf/bin/fzf"

alias vimf="vim \$(fzf)"
alias gvimf="gvim \$(fzf)"

alias apts="apt-cache search"
alias apti="apt-get install"
alias sapti="sudo apt-get install"

set -g mouse on

bindkey jk vi-cmd-mode

# [[ $TERM != "screen" ]] && exec tmux

alias -s {txt,js,jsx,ts,tsx}=nvim
alias -s {uml,yaml}=vim

# zle -N exit exit
# bindkey ^q exit

# alias rbook="ls ~/books | dmenu -i -l 30 | xargs -I{} zathura ~/books/{}"

export PATH=$HOME/utils:$PATH

alias fcd="cd \$(ls -R | grep "^\./" | fzf | awk -F'[:]' '{print $1}')"
alias lee="leetcode"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /home/vlad/.config/broot/launcher/bash/br
bindkey -s ^b 'br\n'
