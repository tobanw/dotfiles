# NOTE: use zshenv to set environment variables for i3 (and hence dmenu)
#
# set i3's default terminal to urxvt
export TERMINAL=urxvt

# set default editor (don't need bindkey -v as zsh infers from this)
export EDITOR=nvim
export VISUAL=nvim

export XDG_CONFIG_DIR="$HOME/.config"

# set browser (used by rtv, urlscan)
#export BROWSER=qutebrowser

# rtv url hinter/extracter
export RTV_URLVIEWER=urlscan


# tools: programming language package dirs, etc
export TOOLS="$HOME/.tools"

# dotfiles repo
export DOTFILES="$HOME/utilities/dotfiles"

# add my scripts to PATH
export PATH="$HOME/.local/bin:$PATH"

# zplug directory
export ZPLUG_HOME="$HOME/.local/share/zplug"

# diff program for pacmatic/pacdiff
export DIFFPROG="/usr/bin/nvim -d"

# set location of weechat config
export WEECHAT_HOME="$XDG_CONFIG_DIR/weechat"

# Anaconda python: after system python
export PATH="$PATH:$TOOLS/anaconda3/bin"

# Python packages: allows system python to load anaconda packages (for pylint); system packages take precedence
export PYTHONPATH="/usr/lib/python3.7/site-packages"
# disabling due to conflict with qutebrowser: python tries to load the anaconda `typing` module, which is built into 3.7 now
#export PYTHONPATH="$PYTHONPATH:$TOOLS/anaconda3/lib/python3.6/site-packages"

# Stan home (to call from Stan.jl)
export CMDSTAN_HOME="$TOOLS/cmdstan-2.18.1"
