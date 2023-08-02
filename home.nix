{ config, pkgs, nixpkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "chris";
  home.homeDirectory = "/home/chris";

  nixpkgs.config = {
    allowUnfree = true;
  };
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

	# Command line applications
    pkgs.micro
    pkgs.kjv
	pkgs.wl-clipboard
	
    # command line tools
	pkgs.starship
    pkgs.lsd
    pkgs.ncdu
	pkgs.nodePackages_latest.gramma   
	pkgs.yt-dlp
	pkgs.acpi
	pkgs.pandoc
	pkgs.topgrade
	pkgs.cosign
    pkgs.btop
    pkgs.gping
    pkgs.glances
    pkgs.afetch
    # System fonts
    
    pkgs.terminus-nerdfont
    #pkgs.corefonts
    #pkgs.vistafonts
    
	# Backup
    pkgs.rclone-browser
	pkgs.rclone
	pkgs.rsync
	pkgs.grsync

	# Extensions for Gnome
    #pkgs.gnomeExtensions.blur-my-shell
	#pkgs.gnomeExtensions.space-bar
	#pkgs.gnomeExtensions.weather-oclock 
    #pkgs.gnomeExtensions.user-themes
    #pkgs.gnomeExtensions.lock-keys
    #pkgs.gnomeExtensions.alphabetical-app-grid
    #pkgs.gnomeExtensions.just-perfection
    #pkgs.gnomeExtensions.dash-to-panel
    #pkgs.gnomeExtensions.arcmenu
    #pkgs.gnomeExtensions.caffeine
        
    pkgs.tela-circle-icon-theme
    pkgs.fluent-icon-theme
    pkgs.bibata-cursors
    pkgs.yaru-theme
    pkgs.ventoy
    pkgs.magic-wormhole-rs
    # pkgs.phinger-cursors
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/chris/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
     EDITOR = "micro";
     XDG_DATA_DIRS="$HOME/.nix-profile/share:/nix/var/nix/profiles/default/share:$XDG_DATA_DIRS";
     NIXPKGS_ALLOW_UNFREE=1;
  };

  programs.bash = {
  	enable = true;
  	bashrcExtra = "afetch";
  	shellAliases = {
  		"home" = "micro ~/.config/home-manager/home.nix";
  		"home-in" = "home-manager switch";
  		"home-up" = "home-manager switch";
        "home-clean" = "home-manager expire-generations -10days";
  		# use lsd as ls
  		"ls" = "lsd";
  		"la" = "lsd -a";
  		"ll" = "lsd -l";
  		"lla" = "lsd -la";
  		"du" = "ncdu";

  		# Yt-dlp aliases
  		"yta-aac" = "yt-dlp --extract-audio --audio-format aac ";
  		"yta-best" = "yt-dlp --extract-audio --audio-format best ";
  		"yta-flac" = "yt-dlp --extract-audio --audio-format flac ";
  		"yta-m4a" = "yt-dlp --extract-audio --audio-format m4a ";
  		"yta-mp3" = "yt-dlp --extract-audio --audio-format mp3 ";
  		"yta-opus" = "yt-dlp --extract-audio --audio-format opus ";
  		"yta-vorbis" = "yt-dlp --extract-audio --audio-format vorbis ";
  		"yta-wav" = "yt-dlp --extract-audio --audio-format wav ";
  		"ytv-best" = "yt-dlp -f bestvideo+bestaudio ";

  		#rclone alias
  		"one" = "rclone bisync $HOME/Documents/Classroom/ one:Classroom -v";
  		"gdrive" = "rclone copy $HOME/Documents/ gcrypt: -v";
  		"resync" = "rclone bisync $HOME/Documents/Classroom/ one:Classroom/ --resync -v";
  		"sync" = "rclone sync $HOME/Documents/ gcrypt: -v";

  		#flatpak backup
  		"flatbk" = "flatpak list --app --columns=application > ~/.config/home-manager/test.txt";
	};

  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # programs.home-manager.autoUpdate.enable = true;
  
  programs.starship = {
  	enable = true;
  	enableBashIntegration = true;
  };
  programs.fish = {
  	enable = true;
  };
  programs.zoxide = {
  	enable = true;
  	enableBashIntegration = true;
  };
}
