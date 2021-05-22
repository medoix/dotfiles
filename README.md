# Dotfiles

These are my dotfiles. Take anything you want, but at your own risk.

It utilises 
[dotbot](https://github.com/anishathalye/dotbot) to manage dotfile linking and setup commands
[dotbot-yay](https://github.com/OxSon/dotbot-yay) to install Arch packages via Pacman or YAY

# Configurations & Packages

## Base Config & Packages are Always Run

[Arch Base Configuration](./config_base.conf.yaml)

[Arch Base Packages](./packages_base.conf.yaml)

## Standalone Config & Packages are Run on the Arch Distro

[Arch Standalone Configuration](./config_arch.conf.yaml)

[Arch Standalone Packages](./packages_arch.conf.yaml)

## WSL Config & Packages are Run on Windows Sub System Linux

[Arch WSL Configuration](./config_wsl.conf.yaml)

[Arch WSL Packages](./packages_wsl.conf.yaml)

## VirtualBox Packages are Run on VirtualBox Instance

[Arch Virtual Packages](./packages_virtualbox.conf.yaml)

# Post Setup
- [Configure pam-gnupg in /etc/pam.d/system-local-login](https://github.com/cruegge/pam-gnupg#setup-guide)
- Add the following to auto unlock on login
    ```
    sudoedit /etc/pam.d/system-local-login

    # Unlock GPG Key
    auth     optional  pam_gnupg.so store-only
    session  optional  pam_gnupg.so
    ```
- Add the following to auto unlock from lock screen
    ```
    sudoedit /etc/pam.d/i3lock

    # Unlock PGP Key
    auth     optional  pam_gnupg.so
    ```

# Setup
## Arch Standlone
- Download Arch ISO and create bootable USB.
- Boot into Arch ISO and setup WiFi (if needed) 
- `nano /etc/wpa_supplicant/wifi.conf`

---
    # AP scanning
    ap_scan=1
    # ISO/IEC alpha2 country code in which the device is operating
    country=US
    # network section generated by wpa_passphrase
    network={
        ssid="MYSSID"
        psk=59e0d07fa4c7741797a4e394f38a5c321e3bed51d54ad5fcbd3f84bc7415d73d
    }
---
- Start wpa_supplicant `wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wifi.conf`
- Start DHCPD to obtain an address `dhcpcd wlan0`
- Run `archinstall` and answer the questions accordingly.
- Follow steps and install `dhcpcd git python3 wpa_supplicant` for additional packages.
- Follow more steps.
- Enter to confirm config and commence install.
- Once install has completed, remove install media and `reboot`
- Set Wifi again as per steps above.
- Clone dotfiles `git clone https://gitlab.com/medoix/dotfiles .dotfiles`
- Configure and Install `./install -p`

## Arch VirtualBox
- Clone dotfiles `git clone https://gitlab.com/medoix/dotfiles .dotfiles`
- Configure and Install `./install -p`
- Disable screen control and sleep settings in the Power Manager

## Arch WSL
- Download the latest `Arch.zip` at [Arch WSL](https://github.com/yuk7/ArchWSL/releases/)
- Extract the content to `C:\Program Files\Arch\`
- Open a terminal and run `Arch.exe` to complete the setup.
- Execute `Arch.exe` again and run the following commands to complete user setup.

---
    echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
    useradd -m -G wheel -s /bin/bash {username}
    passwd {username}
    exit
    Arch.exe config --default-user {username}
    Arch.exe
    sudo pacman-key --init
    sudo pacman-key --populate
    sudo pacman -Syu
---

- Download [SauceCodePro](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip) font and install the "Windows Compatible" files.
- In Windows Terminal `settings.json` add `fontFace` and `fontSize` with your font choices.

---
    {
        "guid": "{a5a97cb8-8961-5535-816d-772efe0c6a3f}",
        "hidden": false,
        "name": "Arch",
        "source": "Windows.Terminal.Wsl",
        "fontSize": 11,
        "fontFace": "SauceCodePro NF",
        "background": "#282a36",
        "foreground": "#f8f8f2",
        "cursorColor":"#f8f8f2",
        "black": "#272822",
        "red": "#F92672",
        "green": "#A6E22E",
        "yellow": "#F4BF75",
        "blue": "#66D9EF",
        "purple": "#AE81FF",
        "cyan": "#A1EFE4",
        "white": "#F8F8F2",
        "brightBlack": "#75715E",
        "brightRed": "#F92672",
        "brightGreen": "#A6E22E",
        "brightYellow": "#F4BF75",
        "brightBlue": "#66D9EF",
        "brightPurple": "#AE81FF",
        "brightCyan": "#A1EFE4",
        "brightWhite": "#F9F8F5"
    }
---
- Set the Arch `guid` to be the default `defaultProfile`
- Clone dotfiles `git clone https://gitlab.com/medoix/dotfiles .dotfiles`
- Configure and Install `./install -p`

## Mac OS X
- `sudo softwareupdate -i -a`
- `xcode-select --install`
- `git clone https://gitlab.com/medoix/dotfiles.git ~/.dotfiles`
* `dotfiles dock` (set [Dock items](./macos/dock.sh))
* `dotfiles macos` (set [macOS defaults](./macos/defaults.sh))

dotfiles
    ~/.config/nvim
    ~/.config/alacritty

brew:
    brew tap homebrew/cask-fonts
    font-sauce-code-pro-nerd-font
    font-hack-nerd-font
    nodejs
    ranger
    bat
    ripgrep

neofetch
zsh
alacritty
lazygit
lazydocker
neovim

fullscreen:
command + control + F
