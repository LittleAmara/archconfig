# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, callPackage, ... }:
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # boot.kernelPackages = pkgs.linuxPackages_latest;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  services.blueman.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.utf8";
    LC_IDENTIFICATION = "fr_FR.utf8";
    LC_MEASUREMENT = "fr_FR.utf8";
    LC_MONETARY = "fr_FR.utf8";
    LC_NAME = "fr_FR.utf8";
    LC_NUMERIC = "fr_FR.utf8";
    LC_PAPER = "fr_FR.utf8";
    LC_TELEPHONE = "fr_FR.utf8";
    LC_TIME = "fr_FR.utf8";
  };

  # virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "amara" ];


  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Enable i3 windows manager
  # services.xserver.windowManager.i3.enable = true;
  # services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;
    desktopManager = {
      # default = "xfce+i3";
      # xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableScreensaver = false;
        enableXfwm = false;
      };
    };
    displayManager.defaultSession = "xfce+i3";
    # displayManager.lightdm.background = "/home/amara/Pictures/wallpapers/lofi_flowers01.jpg";
    #displayManager.lightdm.greeters.mini = {
    #  enable = true;
    #  user = "amara";
    #  extraConfig = ''
    #    [greeter]
    #    password-label-text = Amara
    #    password-alignment = left
    #    [greeter-theme]
    #    background-image = "/etc/lightdm/wallpaper.jpg"
    #  '';
    #};
    displayManager.autoLogin = {
      enable = true;
      user = "amara";
    };
    windowManager.i3.package = pkgs.i3-gaps;
    windowManager.i3.enable = true;
  };

  services.xserver.videoDrivers = [ "modesetting" ];
  #     Option "DRI" "2"
  services.xserver.deviceSection = ''
    Option "TearFree" "true"
  '';
  hardware.opengl.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  virtualisation.docker.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    xkbOptions = "terminate:ctrl_alt_bksp,compose:ralt";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amara = {
    isNormalUser = true;
    description = "amara";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      firefox
      thunderbird
      kitty
      slack
      discord
      spotify
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Packages
  environment.systemPackages = with pkgs;
    [
      # Editors
      vim

      # Utils
      wget
      tree
      psmisc # Provides: fuser, killall, pstree, peekfd
      rofi
      nitrogen
      i3blocks
      bat
      fd
      nixpkgs-fmt
      rnix-lsp #nix lsp
      nil #nix lsp
      pyright
      fzf
      black
      picom
      polybarFull
      cmake-language-server
      fish
      zoxide
      sonixd # Replace spotify
      ripgrep # Mandatory if i want to use live_grep of telescope (nvim)
      betterlockscreen
      jq
      catppuccin-gtk

      # Development
      git
      gcc
      python310
      python310Packages.pip
      docker-compose
      nodejs
      clang-tools
      ccls
      pre-commit
      gnumake
      cmake
      binutils
      man-pages
      man-pages-posix
      gdb
      go
      jetbrains.idea-ultimate
      maven
      jdk17
      tree-sitter
      starship
      poetry
      neovim
      gopls
    ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    # fira-code
    fira-code-symbols
    iosevka-comfy.comfy-wide
    # font-awesome
  ];

  system.autoUpgrade.enable = false;
  # system.autoUpgrade.allowReboot = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   pinentryFlavor = "curses";
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
