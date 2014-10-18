# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="amuse-me"
export EDITOR='subl -w'

# Example aliases
## Colorize the ls output ##

 alias zshconfig="open ~/.zshrc"
 alias ohmyzsh="open ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails rsync colorize)

plugins=(common-aliases osx brew brew-cask history history-substring-search git git-remote-branch git-extras git-flow github sudo docker extract go golang zsh_reload z boot2docker zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# /opt/local/libexec/gnubin:

export PATH=/usr/local/bin:/usr/local/sbin:/Users/meabed/bin:/usr/local/opt/php54/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH

fpath=(/usr/local/share/zsh/site-functions $fpath)

# load our own completion functions
#fpath=(~/.zsh/completion $fpath)

# load custom executable functions
#for function in ~/.zsh/functions/*; do
for function in /usr/local/share/zsh/site-functions/*; do
  #source $function
done

source /usr/local/share/zsh/site-functions/_aws
source /usr/local/share/zsh/site-functions/_docker
source /usr/local/share/zsh/site-functions/_go

# completion
#zmodload zsh/complist
#autoload -U compinit
#compinit

#zstyle ':completion:::::' completer _force_rehash _complete _approximate
zstyle ':completion:::::' completer _complete _approximate

zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes

#zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
# make autocompletion faster by caching and prefix-only matching
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# get better autocompletion accuracy by typing longer words
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# ignore completion functions for commands you don't have
# zstyle ':completion:*:functions' ignored-patterns '_*'

# allow one error for every three characters typed
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==36=36}:${(s.:.)LS_COLORS}")';
zstyle ':completion:*' squeeze-slashes true

# completing process IDs with menu selection
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':filter-select:highlight' matched fg=red
zstyle ':filter-select' max-lines 1000
zstyle ':filter-select' rotate-list yes
zstyle ':filter-select' case-insensitive yes # enable case-insensitive search

# Enable Colours
export CLICOLOR=1

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# load thoughtbot/dotfiles scripts
export PATH="$HOME/.bin:$PATH"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# functions
[[ -f ~/.functions ]] && source ~/.functions

export GOROOT=/usr/local/Cellar/go/1.3.3/libexec
export GOPATH=/Users/meabed/Development/go
export PATH="$PATH:$GOPATH/bin"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

    export DOCKER_CERT_PATH=/Users/meabed/.boot2docker/certs/boot2docker-vm
    export DOCKER_TLS_VERIFY=1
    export DOCKER_HOST=tcp://192.168.59.103:2376
