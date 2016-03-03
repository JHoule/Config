# History
HISTSIZE=100
SAVEHIST=100
HISTFILE=~/.zhistory
setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_no_store
setopt hist_no_functions
setopt no_hist_beep
setopt hist_save_no_dups

# Use '/' as word separator.
local WORDCHARS=${WORDCHARS//\//}

# Ctrl-left/right in OSX
bindkey '^[[5D' backward-word
bindkey '^[[5C' forward-word
# Ctrl-left/right in Cygwin
bindkey ';5D' backward-word
bindkey ';5C' forward-word


##############
## PACKAGES ##
###############################################################################

# MacTex.
[[ -d /usr/texbin ]] && path=( /usr/texbin $path )

## Set MacPorts.
[[ -d /opt/local/bin  ]] && path=( /opt/local/bin  $path )
[[ -d /opt/local/sbin ]] && path=( /opt/local/sbin $path )
[[ -d /opt/local/man  ]] && set MANPATH="/opt/local/man:${MANPATH}"

## Homebrew
[[ -d $HOME/homebrew/bin ]] && path=( $HOME/homebrew/bin $path )

## All of the packages installed locally.
if [[ -d ${HOME}/local ]]; then
   for pkg in ${HOME}/local/*; do
      [[ -d "${pkg}/bin" ]] && path=( "${pkg}/bin" $path )
   done
fi

## Windows executables.
[[ -d /cygdrive/c/Windows/system32 ]] && path=( $path /cygdrive/c/Windows/system32 )
