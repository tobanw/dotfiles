# NOTE: use zshenv to set environment variables for i3 (and hence dmenu)
#
# set i3's default terminal to urxvt
export TERMINAL=urxvt

# set default editor (don't need bindkey -v as zsh infers from this)
export EDITOR=nvim
export VISUAL=nvim

# set browser (used by rtv, urlscan)
#export BROWSER=qutebrowser

# rtv url hinter/extracter
export RTV_URLVIEWER=urlscan

# dotfiles repo
export DOTFILES="$HOME/utilities/dotfiles"

# add my scripts to PATH
export PATH="$HOME/.local/bin:$PATH"

# zplug directory
export ZPLUG_HOME="$HOME/.local/share/zplug"

# diff program for pacmatic/pacdiff
export DIFFPROG="/usr/bin/nvim -d"

# set location of weechat config
export WEECHAT_HOME="$HOME/.config/weechat"

# Anaconda python: after system python
export PATH="$PATH:/home/toban/utilities/anaconda3/bin"

# Python packages: allows system python to load anaconda packages (for pylint)
export PYTHONPATH="$PYTHONPATH:/home/toban/utilities/anaconda3/lib/python3.6/site-packages"
