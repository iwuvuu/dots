# My dotfiles

Managed using [yolk](https://github.com/elkowar/yolk).

# Features

- Dynamic colorschemes for most applications.
- GUI wallpaper switcher using rofi-wayland

# Installation

## Dependencies

For Arch:

1. Install yay or your favourite AUR helper (change commands accordingly)
2. Install these dependencies:
``` bash
yay -S rofi-wayland hyprpm wmctrl
```
3. Install optional dependencies:
``` bash
yay -S kitty nvim zsh zsh-syntax-highlighting
```

### List of dependencies

**Necessary dependencies**

- rofi-wayland - used as an application launcher and for other menus
- wmctrl - tool to control hyprland from terminal
- hyprland
    - Hyprspace plugin - overview
    - hyprsplit - split workspaces (dwm like)
- hyprpm - wallpaper funcionality for hyprland
- alsa-utils - using alsa and amixer for volume control and widgets
- playerctl

**Optional dependencies**

- *kitty* - terminal emulator; for different emulator change the terminal value in options
- *Neovim* - text editor

# Roadmap

- [x] Kitty config
- [] Neovim config - add colorscheme switching
