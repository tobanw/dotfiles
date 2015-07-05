# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/toban/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# load antigen
source ~/utilities/rc-files/antigen/antigen.zsh

# load the oh-my-zsh library
antigen use oh-my-zsh

# bundles from default repo (oh-my-zsh)
# antigen bundle git

# enhanced vi mode
antigen bundle vi-mode

# syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# 256 color terminal
antigen bundle chrissicool/zsh-256color

# liquidprompt
antigen bundle nojhan/liquidprompt
 
# tell antigen that you're done
antigen apply


# set default editor (don't need bindkey -v as zsh infers from this)
export EDITOR=vim
export VISUAL=vim

# added by Anaconda3 2.1.0 installer
export PATH="/home/toban/utilities/anaconda3/bin:$PATH"
