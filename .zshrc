# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# go shit 
export PATH="$PATH:$(npm bin -g)"

# Path to guiscrcpy
# export XDG_DESKTOP_DIR="~/.config/guiscrcpy/"
export EDITOR=nvim
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME="spaceship"
# ZSH_THEME="agnoster"
#ZSH_THEME="norm"
 ZSH_THEME="fishy"
#
#dst
#'tjkirch_mod
#candy-kingdom

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="spaceship"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  )

source $ZSH/oh-my-zsh.sh

##Colorscheme for ZSH
source ~/.config/zshrc.d/dots-hyprland.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
fi

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

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}
add-zsh-hook -Uz precmd rehash_precmd

## ------------ COLORS ------------ ##

# Reset #
Color_Off='\033[0m' # Text Reset

# Regular Colors #
Black='\033[0;30m'  Red='\033[0;31m'     Green='\033[0;32m'  Yellow='\033[0;33m'
Blue='\033[0;34m'   Purple='\033[0;35m'  Cyan='\033[0;36m'   White='\033[0;37m'

# Bold #
BBlack='\033[1;30m' BRed='\033[1;31m'    BGreen='\033[1;32m' BYellow='\033[1;33m'
BBlue='\033[1;34m'  BPurple='\033[1;35m' BCyan='\033[1;36m'  BWhite='\033[1;37m'

# Underline #
UBlack='\033[4;30m' URed='\033[4;31m'    UGreen='\033[4;32m' UYellow='\033[4;33m'
UBlue='\033[4;34m'  UPurple='\033[4;35m' UCyan='\033[4;36m'  UWhite='\033[4;37m'

# Background #
On_Black='\033[40m' On_Red='\033[41m'    On_Green='\033[42m' On_Yellow='\033[43m'
On_Blue='\033[44m'  On_Purple='\033[45m' On_Cyan='\033[46m'  On_White='\033[47m'

## ------------ COLORS ------------ ##


# export QT_QPA_PLATFORM=wayland
# exodiafetch
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



## JAVA HOME FOR REACT NATIVE

 # JAVA_HOME=$(dirname $( readlink -f $(which java) ))
 # JAVA_HOME=$(realpath "$JAVA_HOME"/../)
 # export JAVA_HOME
 # if above doesnt work, 
 
# export JAVA_HOME="/usr/lib/jvm/java-11-openjdk/bin/java"
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk

#tmux color fix;
export TERM=xterm-256color

#------------path to scripts;------------
export PATH=$HOME/.local/bin:$PATH

# #---------react native shits-------------
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

#
# #qt5fix
export QT_QPA_PLATFORM="qt5ct"
export QT_QPA_PLATFORMTHEME="qt5ct"

#gtk theme fix
export GTK_THEME=Breeze

# # #wayland fix
export QT_QPA_PLATFORM=wayland
#  #export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_CURRENT_DESKTOP_TYPE=wayland
export GDK_BACKEND="wayland,x11"
export MOZ_ENABLE_WAYLAND=1
#
# #-------------alias----------------------

alias ls="exa"
alias ll="exa -l"
alias yt="ytfzf -t"
alias notes="cd ~/Documents/Notes/"
alias dwm="cd ~/.local/src/dwm"
alias scripts="cd ~/.local/bin"
alias marja="shutdown now"
alias soja="systemctl suspend"
alias chut="neofetch"
alias trashcodes="cd ~/Documents/TrashCodes/"
alias install="sudo pacman -S"
alias uninstall="sudo pacman -Rn"
alias pm="pulsemixer"
alias nd="neovide"
alias startplasma="sudo systemctl start --now sddm" 
# alias mongodb="sudo mongod --fork --logpath /var/lib/mongodb/mongodb.log --dbpath /var/lib/mongodb"
alias rem="trash-put"
alias zt="zathura"
alias ebooks="cd /home/xtan/Sync/EBOKKS/"
alias sd='tmux new-session -c "$(find ~/Lxarn-xw ~/Projects -maxdepth 5 -type d | fzf)" -- nvim'
alias fmpv='$(find /media/ntfs/ReactTutorial -type f | fzf) --mpv'
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg" 
alias rm-norestore="shred -zvu -n  5"
alias halt="sudo systemctl hibernate"
alias powersave="sudo auto-cpufreq --force=powersave"
alias normal="sudo auto-cpufreq --force=reset"
alias performance="sudo auto-cpufreq --force=performance"
alias code="vscodium"
alias downmusic="yt-dlp -f bestaudio"
alias toclip="xclip -sel clip < "
alias chutfetch="fastfetch"
alias deletenodemodulesinthisdirectory="find . -name "node_modules" -type d -exec rm -rf {} \;"
alias suod="sudo"
alias ls="lsd"

# tmux color fix for pywall
#
# if [ -z "$TMUX" ]; then
# (cat ~/.cache/wal/sequences &)
# fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/xtan/google-cloud-sdk/path.zsh.inc' ]; then . '/home/xtan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/xtan/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/xtan/google-cloud-sdk/completion.zsh.inc'; fi
# Auto Launch Hyprland Instantly after loggin from TTY
source ~/.config/zshrc.d/auto-Hypr.sh


declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"

# eval "$(starship init zsh)"
