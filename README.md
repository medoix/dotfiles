# Dotfiles

These are my dotfiles. Take anything you want, but at your own risk.

It utilises 
[dotbot](https://github.com/anishathalye/dotbot) to manage dotfile linking and setup commands
[dotbot-yay](https://github.com/OxSon/dotbot-yay) to install Arch packages via Pacman or YAY

# Configurations & Packages
[Arch Standalone Configuration](./config_arch.conf.yaml)

[Arch Standalone Packages](./packages_arch.conf.yaml)

[Arch WSL Configuration](./config_wsl.conf.yaml)

[Arch WSL Packages](./packages_wsl.conf.yaml)

# Setup
## Arch Standlone


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
        "fontFace": "SauceCodePro NF"
    }
---
- Set the Arch `guid` to be the default `defaultProfile`




On a sparkling fresh installation of macOS:

    sudo softwareupdate -i -a
    xcode-select --install

The Xcode Command Line Tools includes `git` and `make` (not available on stock macOS).
Then, install this repo with `curl` available:

    bash -c "`curl -fsSL https://gitlab.com/medoix/dotfiles/raw/master/install.sh`"

This will clone (using `git`), or download (using `curl` or `wget`), this repo to `~/.dotfiles`. Alternatively, clone manually into the desired location:

    git clone https://gitlab.com/medoix/dotfiles.git ~/.dotfiles

Use the [Makefile](./Makefile) to install everything [listed above](#package-overview), and symlink [runcom](./runcom) and [config](./config) (using [stow](https://www.gnu.org/software/stow/)):

    cd ~/.dotfiles
    make

## Post-install

* `dotfiles dock` (set [Dock items](./macos/dock.sh))
* `dotfiles macos` (set [macOS defaults](./macos/defaults.sh))
* Mackup
	* Log in to Google Drive/Dropbox
	* `mackup restore`
	* `ln -s ~/.config/mackup/.mackup.cfg ~` (until [#632](https://github.com/lra/mackup/pull/632) is fixed)

## The `dotfiles` command

    $ dotfiles help
    Usage: dotfiles <command>

    Commands:
       clean            Clean up caches (brew, npm, gem, rvm)
       dock             Apply macOS Dock settings
       edit             Open dotfiles in IDE (code) and Git GUI (stree)
       help             This help message
       macos            Apply macOS system defaults
       test             Run tests
       update           Update packages and pkg managers (OS, brew, npm, gem)

## Customize/extend

You can put your custom settings, such as Git credentials in the `system/.custom` file which will be sourced from `.bash_profile` automatically. This file is in `.gitignore`.

Alternatively, you can have an additional, personal dotfiles repo at `~/.extra`. The runcom `.bash_profile` sources all `~/.extra/runcom/*.sh` files.

## Additional resources

- [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles)
- [Homebrew](https://brew.sh)
- [Homebrew Cask](http://caskroom.io)
- [Bash prompt](https://wiki.archlinux.org/index.php/Color_Bash_Prompt)
- [Solarized Color Theme for GNU ls](https://github.com/seebi/dircolors-solarized)
