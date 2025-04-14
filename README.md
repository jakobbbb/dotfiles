dotfiles and other stuff I use

## theme
![screenshot](https://gist.githubusercontent.com/jakobbbb/59c7330f0bc29ebef697bb40e421349f/raw/autumn.png)

The default theme is a purple one, but I've been on the autumn-vibey one for a while now.
It can be activated with `thm autumn`.
The theme uses bettergruvbox, but patched it with the `./misc/patch_bettergruvbox.sh` script :3

The purple theme uses a patched version of Arc-Dark, which can be installed by
navigating to `misc/gtk-theme` and running `makepkg -scfi`.

## deploy
Run `./deploy.py` to symlink the dotfiles.

Files in `etc` must be copied manually.

The `misc` directory contains some useful scripts, e.g. to configure
xdg defaults and to install a set of ~200 packages that i consider
important

## more useful things
https://github.com/jakobbbb/dotfiles/wiki

## machines
| branch | machine |
|-|-|
| `main`| desktop |
| `b11` | uni workstation |
| `x230` | personal X230 |
| `l14` | personal L14 |
| `t420` | personal T420 |
| `msi` | msi laptop |

Since the laptops typically require more configuration than my desktop,
I just rebase the laptop branches on main.
