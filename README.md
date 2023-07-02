# home-manager Config
Home manager config

These steps are meant to be used with home-manager and nix on a fedora Silver Blue install.

1. Install the desired Silverblue image from [Ublue](https://ublue.it)

2. Use the scripts from [dnkmmr69420/nix-installer-scripts](https://github.com/dnkmmr69420/nix-installer-scripts).

#### Nix Silverblue installer

```curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/silverblue-nix-installer.sh | bash```

3. Enable home-manager through the following steps.

`nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update`

`nix-shell '<home-manager>' -A install`

4. `git clone https://github.com/Chheater/home-manager.git` into the .config file.

5. Run `home-manager switch`

#### Install flatpak

1. Enable user flatpak `flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    --user`

1. Run `flatpak install --user -y $(cat test.txt)`
