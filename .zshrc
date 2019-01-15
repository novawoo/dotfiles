# Path to your oh-my-zsh installation.
export ZSH=/Users/nova/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
fpath=(/usr/local/share/zsh-completions $fpath)
plugins=(git osx gem svn brew bower gradle grunt npm mvn grails meteor jenv brew-cask springboot )

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
JAVA_HOME=`/usr/libexec/java_home`
export JAVA_HOME

ANDROID_HOME="/Users/nova/Library/Android/sdk"
export ANDROID_HOME

DOTFILES_HOME="/Users/nova/dotfiles"
export DOTFILES_HOME

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$DOTFILES_HOME/bin"

GRADLE_HOME="/usr/local/Cellar/gradle/2.3/libexec"
export GRADLE_HOME

export GROOVY_HOME="/usr/local/opt/groovy/libexec"

# set homebrew unauto update
export HOMEBREW_NO_AUTO_UPDATE=true

source $ZSH/oh-my-zsh.sh

# set npm completion
#. <(npm completion)

# set vi model
set -o vi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else #   export EDITOR='mvim' # fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mvim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias vimconfig="mvim ~/.vimrc"
alias vimsource="source ~/.vimrc"
alias ohmyzsh="mvim ~/.oh-my-zsh"
alias notes="mvim -c Geeknote"
alias cls='clear'
alias grep='grep --color=auto'
alias -s html=mvim # 在命令行直接输入后缀为html的文件名，会在MacVim中打开
alias -s java=mvim
alias -s xml=mvim
alias -s txt=mvim
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
alias blog='tmux a -t blog -d'
alias three='vim /Users/nova/JD/three/temp.md'
alias week='vim /Users/nova/JD/three/week.md'
alias aria2rpc='aria2c --conf-path=/Users/nova/Documents/aria2.conf -D'

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/nova/.gvm/bin/gvm-init.sh" ]] && source "/Users/nova/.gvm/bin/gvm-init.sh"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

