import os

deploy = (".vim", ".config", ".zsh", ".mutt") # files with this prefix are symlinked

HOMEDIR = "/home/jakob/"
DOTFILEDIR = "/home/jakob/dotfiles/"

def symlink(f1, f2):
    print "ln -sr %s %s" % (f1, f2)
    return

def getFFprofile():
    # figure out default ff profile
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
    except Exception, e:
        print "[:(]", e
    return ini[default]["Path"]

for root, dirs, files in os.walk(".", topdown=True):
    for name in files:
        file_name = os.path.join(root, name)
        file_short = file_name[2:]
        if file_short.startswith(deploy):
            print "mkdir --parents " + HOMEDIR + root[2:]
            symlink(DOTFILEDIR+file_short, HOMEDIR+file_short)
        elif file_short.startswith(".mozilla"):
            symlink(DOTFILEDIR+file_short, HOMEDIR+file_short.replace("profile", getFFprofile()))

