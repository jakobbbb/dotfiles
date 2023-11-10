dotfiles and other stuff I use

## screenshot
![screenshot](https://gist.githubusercontent.com/jakobbbb/59c7330f0bc29ebef697bb40e421349f/raw/neofetch.png)

## theme
I use a version of Arc-Dark that I've patched to be a dark purple.

![screenshot](https://gist.githubusercontent.com/jakobbbb/59c7330f0bc29ebef697bb40e421349f/raw/theme.png)

To install using, navigate to `misc/gtk-theme` and run `makepkg -scfi`.

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
| `x230` | personal X230 |
| `x230_work` | work X230 |
| `t420` | personal T420 |
| `msi` | msi laptop |
| `s143` | uni workstation |

Since the laptops typically require more configuration than my desktop,
I just rebase the laptop branches on main.
