# vim:fileencoding=utf-8:foldmethod=marker

{ config, pkgs, inputs,  ... }:

{
  # Nvidia {{{

  ## Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };



  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    
    # Modesetting is required.
    modesetting.enable = true;

   # Enable the Nvidia settings menu,
   # accessible via 'nvidia-settings'
   nvidiaSettings = true;

   # Optionally, you may need to select the appropriate driver version for your specific GPU.
   package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  # }}}

  # Imports {{{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # }}}

  # System {{{

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixie"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # }}}

  # Users {{{

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.oliver = {
    isNormalUser = true;
    description = "oliver";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  users.defaultUserShell = pkgs.fish;

  # }}}

  # Home Manager {{{

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "oliver" = import ../../modules/home.nix;
    };
  };

  # }}}

  # Packages {{{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  
  environment.systemPackages = with pkgs; [
  ];
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs.git.enable = true;
  programs.fish.enable = true;
  programs.neovim = {
    enable = true;
  };

  # }}}

  # Services {{{
  # List services that you want to enable:

  # Xserver
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      sddm = {
	enable = true;
	package = pkgs.plasma5Packages.sddm;
	extraPackages = [
	  pkgs.catppuccin-sddm-corners
	];
        theme = "catppuccin-sddm-corners";
      };
    };
  };

  # CUPS
  services.printing.enable = true;

  # OpenSSH daemon.
  services.openssh.enable = true;

  # Pipewire
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    # valsa.enable = true;
    # alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # }}}

  # Version {{{

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # }}}
}
