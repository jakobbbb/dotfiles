#!/usr/bin/env python3

import os
import textwrap
from enum import Enum
from collections import Counter

DeployStatus = Enum(
    "DeployStatus", ["AlreadyGood", "MovedOriginal", "CreatedNew", "Failure"]
)


# These files/directories will be deployed.
DEPLOY_FILES = (
    ".Xresources",
    ".config",
    ".emacs",
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
    ".zsh",
    "bin",
)

HOMEDIR = os.path.expanduser("~") + "/"
DOTFILEDIR = os.path.dirname(os.path.realpath(__file__))


def get_firefox_profile():
    """
    Used for deploying userChrome.
    """
    default_profile = None
    try:
        with open(HOMEDIR + ".mozilla/firefox/profiles.ini", "r") as f:
            for line in f.read().splitlines():
                if len(line) > 1:
                    if line[0] + line[-1] == "[]":
                        pass
                    elif "=" in line:
                        key, value = line.split("=")
                        if key == "Default":
                            default_profile = value
                            break
        if default_profile is None:
            print(":| Firefox profile not found")
            return False
        path = HOMEDIR + ".mozilla/firefox/" + default_profile
        if os.path.exists(
            path + "/extensions/treestyletab@piro.sakura.ne.jp.xpi"
        ):
            return default_profile
        else:
            print(":| TST not found, not deploying userChrome")
            print(path + "/extensions/treestyletab@piro.sakura.ne.jp.xpi")
            return False
    except Exception as e:
        print(":( (FF)", e)
        return False


def deploy_file(source, target):
    status = DeployStatus.CreatedNew
    target_dir = os.path.dirname(target)

    if os.path.lexists(target):
        if os.path.realpath(target) == os.path.realpath(source):
            status = DeployStatus.AlreadyGood
            return status
        else:
            target_bak = target + ".bak"
            print(
                f"Warning: File '{target}' exists, "
                "but is not the correct symlink. "
            )
            print(f"    should be: {source}")
            print(f"    but it is: {os.path.realpath(target)}")
            os.rename(target, target_bak)
            status = DeployStatus.MovedOriginal
    elif not os.path.exists(target_dir):
        os.makedirs(target_dir)

    os.symlink(source, target)
    return status


def print_deploy_error(source, target, error):
    print("Error while deploying:")
    print(f"    source: {source}")
    print(f"    target: {target}")
    print(textwrap.indent(str(error), "    "))
    print()


def main():
    stats = []
    os.chdir(DOTFILEDIR)
    for root, _, files in os.walk(".", topdown=True):
        for name in files:
            file_name = os.path.join(root, name)  # starts with ./
            file_short = file_name[2:]  # ./ removed
            root_short = root[2:]  # ./ removed
            target = None
            source = os.path.join(DOTFILEDIR, file_short)
            target = os.path.join(HOMEDIR, file_short)

            if not file_short.startswith(DEPLOY_FILES):
                continue

            if file_short.startswith(".mozilla"):
                firefox_profile = get_firefox_profile()
                if firefox_profile:
                    target = target.replace("profile", firefox_profile)
                    root_short = root_short.replace("profile", firefox_profile)
                else:
                    stats.append(DeployStatus.Failure)
                    print_deploy_error(
                        source, target, "Could not find Firefox profile"
                    )
                    continue

            try:
                result = deploy_file(source, target)
                stats.append(result)
            except Exception as e:
                print_deploy_error(source, target, e)

    for status, n in Counter(stats).most_common():
        o = len(DeployStatus.__name__) + 1
        print(f"{str(status)[o:]}: {n} files")
    print("Deployed dotfiles :3")


if __name__ == "__main__":
    main()
