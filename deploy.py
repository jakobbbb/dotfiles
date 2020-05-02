#!/usr/bin/python

from __future__ import print_function
import os
import subprocess
from sys import argv

# files with this prefix are symlinked
deploy = (
        ".config",
        ".ghci",
        ".gtkrc-2.0",
        ".ideavimrc",
        ".latexmkrc",
        ".local",
        ".mozilla",
        ".mutt",
        ".oh-my-zsh",
        ".vim",
        ".xinitrc",
        ".zsh"
        )

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
    try:
        with open(HOMEDIR + ".mozilla/firefox/profiles.ini", "r") as f:
            for line in f.read().splitlines():
                if len(line) > 1:
                    if line[0] + line[-1] == "[]":
                        section = line[1:-1]
                    elif "=" in line:
                        key, value = line.split("=")
                        if key == "Default":
                            default_profile = value
                            break
        path = HOMEDIR + ".mozilla/firefox/" + default_profile
        if os.path.exists(path + "/extensions/treestyletab@piro.sakura.ne.jp.xpi"):
            return default_profile
        else:
            print(":| TST not found, not deploying userChrome")
            print(path + "/extensions/treestyletab@piro.sakura.ne.jp.xpi")
            return False
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
                    root_short = root_short.replace("profile", FFprofile)
                else:
                    do_deploy = False
            else: # default target
                target = HOMEDIR+file_short

            if os.path.exists(target): # target file exists?
                if os.path.realpath(target) == DOTFILEDIR+file_short: # is already properly symlinked?
                    do_deploy = False
            elif not os.path.exists(HOMEDIR+root_short): # parent folder doesn't exist?
               execute(["mkdir", "--parents", HOMEDIR+root_short])

            if do_deploy:
                execute(["ln", "-sr", DOTFILEDIR+file_short, target])

if no_errors:
    print(":) Sucessfully deployed dotfiles!")
else:
    print(":/ Some things went wrong")
