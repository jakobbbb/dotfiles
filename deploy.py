import os

deploy = (".vim", ".config", ".zsh", ".mozilla") # files with this prefix are symlinked

HOMEDIR = "/home/jakob/"
DOTFILEDIR = "/home/jakob/dotfiles/"

for root, dirs, files in os.walk(".", topdown=True):
    #print "root:", root
    #print "dirs:", dirs
    #print "files:", files
    for name in files:
        file_name = os.path.join(root, name)
        file_short = file_name[2:]
        if file_short.startswith(deploy):
            print "mkdir --parents " + HOMEDIR + root[2:]
            print "ln -sr %s %s" % (DOTFILEDIR+file_short, HOMEDIR+file_short)
    #for name in dirs:
    #    print(os.path.join(root, name))
