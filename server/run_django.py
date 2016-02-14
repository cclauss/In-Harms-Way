#!/usr/bin/env python

import os, sys, webbrowser

try:    from subprocess import getstatusoutput # Python3
except: from commands   import getstatusoutput # Python2

def shell_command(command): # do the command and print the output
    cmdResults = getstatusoutput(command)
    if True:  # not cmdResults[0]:
        for theLine in cmdResults[1].splitlines():
            print(theLine.partition('==')[0])

if __name__ == '__main__':
    port = os.getenv('VCAP_APP_PORT', None)
    if port:  # running on Bluemix 
        shell_command('python manage.py runserver --noreload 0.0.0.0:' + port)
    else:     # running locally
        webbrowser.open('http://127.0.0.1:8000')
        shell_command('python3 manage.py runserver')
