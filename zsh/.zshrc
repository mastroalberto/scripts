# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

 zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to change how often to auto-update (in days).
 zstyle ':omz:update' frequency 13


# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git 
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

alias cls='clear'
alias dfi='sudo dnf install'
alias dfr='sudo dnf remove'
alias docs='cd ~/Documenti'
alias down='cd ~/Scaricati'
alias gitdir='cd ~/Documenti/git'
alias update='sudo /home/alberto/update-all.sh'
alias zshrc="micro /home/alberto/.zshrc"
alias pf="pfetch"
alias gitpush="~/./gitpush.sh"
