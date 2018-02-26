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

# Get current values: $ xset q
# Key repeat: $ xset r rate [delay (ms)] [rate (hz)]
xset r rate 280 40
xset -b # no bell
# display power saving (disable as workaround for autorandr)
#xset s off -dpms

# Initial display setup -- using autorandr for live swapping!
#if [[ "$(xrandr | grep 'HDMI1 connected')" != "" ]]; then
#	sleep 1 && xrandr --output eDP1 --off --output HDMI1 --auto
#else
#	sleep 1 && xrandr --output eDP1 --auto --output HDMI1 --off
#fi

# existence function
exists() {
	type "$1" >/dev/null 2>/dev/null
}

# random wallpaper from ~/.wallpaper
exists feh && feh --bg-fill --no-fehbg --randomize ~/.wallpaper/* &

# xautolock:
# * lock after duration (min) of inactivity (-n necessary for killer to work)
# * notify (sec) before locking
# * killer:
# 	*suspend after an additional duration (min):
# 		* `-killtime 20 -killer "systemctl suspend" \`
# 	* power down displays after an additional duration (min)
# 		* `-killtime 20 -killer "xset dpms force standby" \`
# * don't lock if mouse in top right corner
exists xautolock && xautolock -time 10 -locker "i3lock -n --color=000000" \
	-notify 30 \
	-notifier "notify-send --urgency=critical --expire-time=15000 'xautolock' 'LOCKING in 30s'" \
	-killtime 20 -killer "xset dpms force standby" \
	-corners 0-00 &

# start up ssh-agent
eval $(ssh-agent)

# NB: lines following `exec` are ignored
exec i3
