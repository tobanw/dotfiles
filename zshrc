# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/toban/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# options
setopt autocd
unsetopt beep
setopt correct
setopt noclobber


# load antigen plugin manager
source ~/utilities/dotfiles/antigen/antigen.zsh

# load the oh-my-zsh library
antigen use oh-my-zsh

# bundles from default repo (oh-my-zsh)
# antigen bundle git
# enhanced vi mode
antigen bundle vi-mode
# taskwarrior completions
antigen bundle taskwarrior

# 256 color terminal
antigen bundle chrissicool/zsh-256color
# liquidprompt
antigen bundle nojhan/liquidprompt
# syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# tell antigen that you're done
antigen apply


# set i3's default terminal to urxvt
export TERMINAL=urxvt

# set default editor (don't need bindkey -v as zsh infers from this)
export EDITOR=nvim
export VISUAL=nvim

# set browser (used by rtv, urlscan)
export BROWSER=qutebrowser

# rtv url hinter/extracter
export RTV_URLVIEWER=urlscan

# set location of weechat config
export WEECHAT_HOME=~/.config/weechat

# Anaconda python: after system python
export PATH="$PATH:/home/toban/utilities/anaconda3/bin"

# ruby gems (local installs)
if which ruby >/dev/null && which gem >/dev/null; then
	PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

#===================================
# ALIASES
#
# Toban pulled many of these from http://tldp.org/LDP/abs/html/sample-bashrc.html 
#
#===================================

# some pacman/pacmatic convenience aliases
alias pacup='sudo pacmatic -Syu'
alias pacin='sudo pacmatic -S'
alias pacinfo='pacman -Qi'
# pacsearch is already provided

alias oldvim='/usr/bin/vim'
alias vim='nvim'

# -i for interactive. Prompts before overwriting/removing.
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias mkdir='mkdir -p' # automatically make parents
alias ls='ls -h --color=auto --group-directories-first'
alias ll='ls -Alv'

# ssh into tesla server with compatible terminal emulator
alias tesla='TERM=xterm ssh tesla'


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
