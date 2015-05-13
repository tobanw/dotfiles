# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v
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

# syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# liquidprompt
antigen bundle nojhan/liquidprompt
 
# tell antigen that you're done
antigen apply


# added by Anaconda3 2.1.0 installer
export PATH="/home/toban/utilities/anaconda3/bin:$PATH"
