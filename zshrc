# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/toban/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zsh options
setopt autocd
unsetopt beep
setopt correct
setopt noclobber

# NOTE: export environment variables in .zshrc so they are available to i3 and dmenu

# completions for google-cloud-sdk
source /opt/google-cloud-sdk/completion.zsh.inc
source /opt/google-cloud-sdk/path.zsh.inc

# ruby gems (local installs)
if which ruby >/dev/null && which gem >/dev/null; then
	export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
fi

# shorthand for zsh calculator: e.g., `= 2.0/3`
function = {
	echo "$(($@))"
}

# drop back down to parent ranger session instead of nested instance
rr() {
	if [ -z "$RANGER_LEVEL" ]
	then
		ranger
	else
		exit
	fi
}

#===================================
# PLUGINS
#
# First install `zplug` from AUR (or install directly)
#===================================

# load zplug
source /usr/share/zsh/scripts/zplug/init.zsh # AUR install location

# 256 color terminal
zplug chrissicool/zsh-256color
# liquidprompt
zplug nojhan/liquidprompt
# sane options
zplug willghatch/zsh-saneopt
# autosuggestions
zplug zsh-users/zsh-autosuggestions
# syntax highlighting
zplug zsh-users/zsh-syntax-highlighting
# notifications for long-running commands
zplug marzocchi/zsh-notify

# extended completions
zplug zsh-users/zsh-completions
# enhanced vi mode
zplug plugins/vi-mode, from:oh-my-zsh
# taskwarrior completions
zplug plugins/taskwarrior, from:oh-my-zsh
# all-in-one extracter
zplug plugins/extract, from:oh-my-zsh
# colored man pages
zplug plugins/colored-man-pages, from:oh-my-zsh

# install new plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# source plugins and add commands to PATH
zplug load


# for zsh-completions plugin to handle pip3
compctl -K _pip_completion pip3


#===================================
# ALIASES
#===================================

# some pacman/pacmatic convenience aliases
alias pacup='sudo -E pacmatic -Syu'
alias pacin='sudo -E pacmatic -S'
alias pacinfo='pacman -Qi'
# pacsearch is already provided

alias oldvim='/usr/bin/vim'
alias vim='nvim'
alias vimdiff='nvim -d'

# -i for interactive. Prompts before overwriting/removing.
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias mkdir='mkdir -p' # automatically make parents
alias ls='ls -h --color=auto --group-directories-first'
alias ll='ls -Alv'

