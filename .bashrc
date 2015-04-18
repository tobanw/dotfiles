#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Default prompt
#PS1='[\u@\h \W]\$ '

# added by Anaconda3 2.1.0 installer
export PATH="/home/toban/utilities/anaconda3/bin:$PATH"

# enable tab-completion when using sudo
complete -cf sudo

# installed liquidprompt via AUR
# load Liquid Prompt: use commands prompt_on and prompt_off to toggle
[[ $- = *i* ]] && source liquidprompt


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
