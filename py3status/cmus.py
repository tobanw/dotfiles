# -*- coding: utf-8 -*-

"""
Displays the cmus playing status and current track.

This will display a playing indicator, artist, and track title with colors.
Set nicer status icons (e.g., FontAwesome) in your i3status configuration (see below).

Configuration parameters:
    - cache_timeout : how often we refresh this module in seconds (default 2)
    - indicator_play : symbol for playing indicator (default '>')
    - indicator_pause : symbol for paused indicator (default '||')
    - indicator_play : symbol for stopped indicator (default '[stopped]')

TODO:
    - add format status string for customizability
    - use try-except blocks for tags in case of missing items
    - custom colors with default to i3status colors (a la mpd_status)
    - option: hide when stopped

Notes:
    - tested with python 2 and 3

@author Toban Wiebe <tobanw@gmail.com>
@license BSD
"""

# import your useful libs here
from time import time
from subprocess import check_output, CalledProcessError


class Py3status:
    # available configuration parameters
    cache_timeout = 2
    indicator_play = '>'
    indicator_pause = '||'
    indicator_stop = '[stopped]'

    def __init__(self):
        """
        This is the class constructor which will be executed once.
        """
        self.text = ''

    def get_cmus_status(self, i3s_output_list, i3s_config):
        """ Get cmus current track. """

        response = {
            'cached_until': time() + self.cache_timeout,
            'full_text': self.text,
            }

        cmd = ['cmus-remote', '-Q']

        try:
            full_status = check_output(cmd, universal_newlines=True).splitlines()
        except CalledProcessError: # cmus not running
            response['full_text'] = '' # show nothing
            return response

        status = {} # parsed dict of player status
        for status_line in full_status:
            # populate dict of status values
            entry = status_line.split(' ')
            if entry[0] == 'status':
                status[entry[0]] = entry[1]
            elif entry[0] == 'duration':
                status[entry[0]] = entry[1]
            elif entry[0] == 'position':
                status[entry[0]] = entry[1]
            elif entry[0] == 'tag':
                status[entry[1]] = ' '.join(entry[2:])
            elif entry[0] == 'set':
                status[entry[1]] = ' '.join(entry[2:])


        # configure output based on playing/paused/stopped
        if status['status'] == 'stopped':
            response['full_text'] = self.indicator_stop # font-awesome icon
            #response['color'] = i3s_config['color_bad']
        elif status['status'] == 'playing':
            response['full_text'] = '{} {} - {}'.format(self.indicator_play,
                                                        status['artist'], status['title'])
            response['color'] = i3s_config['color_good']
        elif status['status'] == 'paused':
            response['full_text'] = '{} {} - {}'.format(self.indicator_pause,
                                                        status['artist'], status['title'])
            response['color'] = i3s_config['color_degraded']
        else:
            response['full_text'] = 'ERROR'

        return response

if __name__ == "__main__":
    """
    Test this module by calling it directly.
    This SHOULD work before contributing your module please.
    """
    from time import sleep
    x = Py3status()
    config = {
        'color_bad': '#FF0000',
        'color_degraded': '#FFFF00',
        'color_good': '#00FF00'
    }
    while True:
        print(x.get_cmus_status([], config))
        sleep(1)
