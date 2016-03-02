#!/usr/bin/python
# -*- coding: utf-8 -*-

# This script is a simple wrapper which prefixes each i3status line with custom
# information. It is a python reimplementation of:
# http://code.stapelberg.de/git/i3status/tree/contrib/wrapper.pl
#
# To use it, ensure your ~/.i3status.conf contains this line:
#     output_format = "i3bar"
# in the 'general' section.
# Then, in your ~/.i3/config, use:
#     status_command i3status | ~/i3status/contrib/wrapper.py
# in the 'bar' section.
# Finally, make sure this file is executable.
#
# In its current version it will display the cpu frequency governor, but you
# are free to change it to display whatever you like, see the comment in the
# source code below.
#
# © 2012 Valentin Haenel <valentin.haenel@gmx.de>
#
# This program is free software. It comes without any warranty, to the extent
# permitted by applicable law. You can redistribute it and/or modify it under
# the terms of the Do What The Fuck You Want To Public License (WTFPL), Version
# 2, as published by Sam Hocevar. See http://sam.zoy.org/wtfpl/COPYING for more
# details.

import sys
import json
import subprocess

def get_cmus_status():
    """ Get cmus current track. """
    cmd = ['cmus-remote', '-Q']
    try:
        full_status = subprocess.run(cmd, stdout=subprocess.PIPE, check=True,
                                     universal_newlines=True)
    except subprocess.CalledProcessError:
        return 'cmus off'
    status = full_status.stdout.split('\n')
    play_status = status[0].split(' ')[1]
    if play_status == 'stopped':
        out = '' # font-awesome icon
    elif play_status == 'playing' or play_status == 'paused':
        for entry in status:
            try:
                tag = entry.split(' ')[1]
                if tag == 'artist':
                    artist = ' '.join(entry.split(' ')[2:])
                elif tag == 'title':
                    track = ' '.join(entry.split(' ')[2:])
            except IndexError:
                continue
            if play_status == 'playing':
                icon = '' # font-awesome icon
            elif play_status == 'paused':
                icon = '' # font-awesome icon
            else:
                icon = play_status
        out = '{} {} - {}'.format(icon, artist, track)
    else:
        out = 'ERROR'
    return out

def get_governor():
    """ Get the current governor for cpu0, assuming all CPUs use the same. """
    with open('/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor') as fp:
        return fp.readlines()[0].strip()

def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()

def read_line():
    """ Interrupted respecting reader for stdin. """
    # try reading a line, removing any extra whitespace
    try:
        myline = sys.stdin.readline().strip()
        # i3status sends EOF, or an empty line
        if not myline:
            sys.exit(3)
        return myline
    # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()

if __name__ == '__main__':
    # Skip the first line which contains the version header.
    print_line(read_line())

    # The second line contains the start of the infinite array.
    print_line(read_line())

    while True:
        line, prefix = read_line(), ''
        # ignore comma at start of lines
        if line.startswith(','):
            line, prefix = line[1:], ','

        j = json.loads(line)
        # insert information into the start of the json, but could be anywhere
        # cmus now playing status
        j.insert(0, {'full_text' : get_cmus_status(), 'name' : 'cmus'})
        # and echo back new encoded json
        print_line(prefix+json.dumps(j))
