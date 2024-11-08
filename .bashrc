#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Android Sdk Path
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
# End of android Sdk Path

# export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"

# JAVA HOME FOR REACT NATIVE
JAVA_HOME=$(dirname $( readlink -f $(which java) ))
JAVA_HOME=$(realpath "$JAVA_HOME"/../)
export JAVA_HOME
# end of java home
#
eval "$(starship init bash)"
. "$HOME/.cargo/env"
