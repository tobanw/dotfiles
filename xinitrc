#!/bin/sh

# user config files
userresources=$HOME/.config/Xresources
usermodmap=$HOME/.config/Xmodmap

# system config files (don't exist)
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# end of default configuration


# User customizations

# this block done above
# load xterm config
# [[ -f ~/.config/Xresources ]] && xrdb -load ~/.config/Xresources
# load keymap
# [[ -f ~/.config/Xmodmap ]] && xmodmap ~/.config/Xmodmap

# Get current values: $ xset q
# Key repeat: $ xset r rate [delay (ms)] [rate (hz)]
xset r rate 280 40
xset -b # no bell
# display power saving (disable as workaround for autorandr)
xset s off -dpms

# Initial display setup -- using autorandr for live swapping!
if [[ "$(xrandr | grep 'HDMI1 connected')" != "" ]]; then
	sleep 1 && xrandr --output eDP1 --auto --output HDMI1 --auto --left-of eDP1
else
	sleep 1 && xrandr --output eDP1 --auto --output HDMI1 --off
fi

# random wallpaper from ~/.wallpaper
feh --bg-fill --no-fehbg --randomize ~/.wallpaper/* &

# existence function
exists() {
	type "$1" >/dev/null 2>/dev/null
}

# autostart
exists redshift && redshift &

# xautolock: lock after duration of inactivity
exists xautolock && xautolock -time 15 -locker 'i3lock --color=000000' &

# NB: lines following `exec` are ignored
exec i3
