#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Default prompt
#PS1='[\u@\h \W]\$ '

# get hostname for account-specific commands
host=`hostname | cut -d. -f1` # period for delimiter, first field

# use Anaconda3 python
if [ $host = "tesla" ]; then
	export PATH=/usr/global/anaconda/bin:$PATH
	# use python3 by default
	source activate py3k
else
	export PATH=/home/toban/utilities/anaconda3/bin:$PATH
fi


#enable bash-completion, if available
[[ -f /usr/share/bash_completion ]] && source /usr/share/bash-completion/bash_completion

# enable tab-completion when using sudo
complete -cf sudo

# can install liquidprompt via AUR
# load Liquid Prompt: use commands prompt_on and prompt_off to toggle
# [[ $- = *i* ]] && source liquidprompt

# enable readline's vi mode
set -o vi

#===================================
# ALIASES
#
# Toban pulled many of these from http://tldp.org/LDP/abs/html/sample-bashrc.html 
#
#===================================

# -i for interactive. Prompts before overwriting/removing.
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p' # automatically make parents
alias ls='ls -h --color=auto'
alias ll='ls -Alhv --color=auto --group-directories-first'



#===================================
# MAN PAGE COLORS
#
# Toban pulled this from https://wiki.archlinux.org/index.php/Man_page#Colored_man_pages
#
#===================================

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}
