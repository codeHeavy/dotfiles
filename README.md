# My Dotfiles

These are my personal dotfiles for my Arch Linux setup.

## Applications Configured

- **Window Manager:** Hyprland
- **Status Bar:** Waybar
- **Application Launcher:** Rofi
- **Terminal:** Ghostty
- **Shell:** Zsh with Oh My Zsh and Starship prompt
- **System Monitor:** btop
- **GTK Theming:** Catppuccin Mocha
- **Browser:** Zen Browser

## Setup

**Warning:** Run these scripts at your own risk. Review the contents of the scripts before executing them.

1.  **Main Setup:**
    The `setup/setup.sh` script will:
    - Install `yay` if it's not already present.
    - Install a list of packages from the official Arch repositories using `pacman`.
    - Install `zen-browser-bin` from the AUR using `yay`.

    Packages installed with `pacman`:
    `ttf-jetbrains-mono-nerd`, `fzf`, `stow`, `ghostty`, `neovim`, `waybar`, `rofi-wayland`, `hyprlock`, `hyprpaper`, `hypridle`, `tree`, `tldr`, `yazi`, `btop`, `brightnessctl`, `cliphist`, `wl-clipboard`, `swappy`, `jq`, `dunst`.

    To run the script:
    ```bash
    ./setup/setup.sh
    ```

2.  **Zsh Setup:**
    The `setup/zsh.sh` script will:
    - Install `zsh`, `git`, and `curl`.
    - Set Zsh as the default shell.
    - Use `stow` to symlink the zsh configuration.
    - Install Oh My Zsh and the `zsh-autosuggestions` and `zsh-syntax-highlighting` plugins.

    To run the script:
    ```bash
    ./setup/zsh.sh
    ```
    After running, you will need to manually add the plugins to your `~/.zshrc` file as instructed by the script.

## Custom Scripts

-   `bin/.local/bin/screenshot.sh`: A script to take a screenshot of the focused monitor using `hyprctl`, `grim`, and `swappy`. The screenshot is saved to `~/Pictures` and copied to the clipboard.
-   `hyprland/.config/hypr/scripts/switch-audio.sh`: A script that uses `rofi` to present a menu of available audio sinks and allows switching the default output device using `wpctl`.

## Stow

This repository uses `stow` to manage symlinks. After running the setup scripts, you can use `stow` to manage the different configurations. For example, to stow the hyprland configuration:

```bash
stow hyprland
```
