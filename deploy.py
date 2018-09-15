#!/usr/bin/python

from __future__ import print_function
import os
import subprocess
from sys import argv

deploy = (".vim", ".config", ".zsh", ".mutt", ".mozilla") # files with this prefix are symlinked

HOMEDIR = os.path.expanduser("~") + "/"
DOTFILEDIR = os.getcwd() + "/"

no_errors = True

def execute(cmd):
    global no_errors
    if len(argv) == 2 and argv[1] == "dry":
        print(" ".join(cmd))
    else:
        try:
            subprocess.check_call(cmd)
        except Exception as e:
            no_errors = False
            print(":(", e)

def getFFprofile():
    # Read FF's profiles.ini to find active FF profile
    # (used for deploying userChrome.css)
    global no_errors
    ini = {}
    try:
        with open(HOMEDIR+"/.mozilla/firefox/profiles.ini", "r") as f:
            for line in f.read().splitlines():
                if len(line) > 1:
                    if line[0] + line[-1] == "[]":
                        section = line[1:-1]
                        ini[section] = {}
                    elif "=" in line:
                        key, value = line.split("=")
                        ini[section][key] = value
                        if [key, value] == ["Default", "1"]:
                            default = section
        return ini[default]["Path"]
    except Exception as e:
        print(":( (FF)", e)
        no_errors = False
        return False


for root, dirs, files in os.walk(".", topdown=True):
    for name in files:
        file_name = os.path.join(root, name) # starts with ./
        file_short = file_name[2:] # ./ removed
        root_short = root[2:] # ./ removed

        do_deploy = True # assume file is to be symlinked

        if file_short.startswith(deploy): # in whitelist?

            if file_short.startswith(".mozilla"): # special FF target
                FFprofile = getFFprofile()
                if FFprofile:
                    target = HOMEDIR+file_short.replace("profile", FFprofile)
            else: # default target
                target = HOMEDIR+file_short

            if os.path.exists(target): # target file exists?
                if os.path.realpath(target) == DOTFILEDIR+file_short: # is already properly symlinked?
                    do_deploy = False
                else:
                    execute(["mv", target, target+".bak"])
            elif not os.path.exists(HOMEDIR+root_short): # parent folder doesn't exist?
               execute(["mkdir", "--parents", HOMEDIR+root_short])

            if do_deploy:
                execute(["ln", "-sr", DOTFILEDIR+file_short, target])

if no_errors:
    print(":) Sucessfully deployed dotfiles!")
else:
    print(":/ Some things went wrong")
