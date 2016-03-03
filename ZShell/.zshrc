
####################
## Special prompt ##
###############################################################################
## Based on powerlevel9k, but tweaked to be more lightweigth.
source ${HOME}/.zjph

# Unicode-only prompt (with "─", \u2500, box drawing line).
#JPH_PPROMPT="$(jph_colstr "╭─(" 6 0)$(jph_colstr "%n@%m" 2 0)$(jph_colstr ")──(" 6 0)$(jph_colstr "%~" 3 0)$(jph_colstr ")──╮" 6 0)"
#JPH_PROMPT="$(jph_colstr "╰─(" 6 0)$(jph_colstr "%T" 5 0)$(jph_colstr ")─" 6 0) "

# Nice prompts, using Powerline fonts.
JPH_SEP_R="▆▄▂" # Plain Unicode.
JPH_SEP_R="" # Requires Powerline font.
#JPH_SEP_R=""
JPH_SEP_E=${JPH_SEP_R}
#JPH_SEP_E=""
JPH_PPROMPT="$(jph_colstr " %n@%m " 4 3)$(jph_colstr "${JPH_SEP_R}" 3 6)$(jph_colstr " %~ " 7 6)$(jph_colstr ${JPH_SEP_E} 6 0)%{$reset_color%}"
JPH_PROMPT="$(jph_colstr " %T " 0 7)$(jph_colstr "${JPH_SEP_E}" 7 0)"
JPH_RPROMPT=""

JPH_RPROMPT_ASYNC=true
JPH_RPROMPT_ASYNC_CLEAR=true

jph_init


###################
## Setup aliases ##
###############################################################################

[[ "${PLAT}" = "Cygwin" ]] && alias git='env -u TZ git' # Fixes issue with Cygwin interaction and git-p4.

case ${PLAT} in
	Darwin)
		#ls_fun() { ${NOCORRECT} ls -Gl $* | less -ERX }
		ls_fun() { nocorrect gls -l --color $* | less -ERX; }
		;;
	Cygwin)
		ls_fun() { nocorrect ls -l --color $* | less -ERX; }
		;;
	*)
		ls_fun() { nocorrect ls -l --color $* | less -ERX; }
		;;
esac

alias ls='ls_fun'
alias l='ls_fun'
alias ll='ls_fun -A'

alias mv='nocorrect mv -i'       # no spelling correction on mv
alias cp='nocorrect cp -i'       # no spelling correction on cp
alias rm='nocorrect rm -i'       # no spelling correction on rm
alias mkdir='nocorrect mkdir'    # no spelling correction on mkdir

#if [[ -f ${HOME}/.aliases ]]; then
#	. ${HOME}/.aliases
#fi
