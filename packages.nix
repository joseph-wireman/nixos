{ config, pkgs, inputs, ... }:


{
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  
  
  
  # And ensure gnome-settings-daemon udev rules are enabled 
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  #minimal gnome
  environment.gnome.excludePackages = (with pkgs; [
    #gnome-console
    #gnome-text-editor
    #snapshot
    #loupe
    gnome-photos
    gnome-tour
    gnome-connections
    simple-scan
    gnome-usage
  ]) ++ 
  (with pkgs.gnome; [
    #gnome-calculator
    gnome-system-monitor
    #file-roller
    #baobab
    cheese
    #gnome-disk-utility
    gnome-logs
    seahorse
    eog
    gnome-maps
    gnome-font-viewer
    yelp
    gnome-calendar
    gnome-contacts
    gnome-music
    gnome-software
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    gnome-weather 
    gnome-clocks
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);
  
  

  services.xserver.excludePackages = (with pkgs; [ 
    xterm 
  ]);

  environment.systemPackages = with pkgs; [
    

    #gnome exclusive
    gnomeExtensions.appindicator
    gnomeExtensions.hide-top-bar
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnomeExtensions.supergfxctl-gex
    gnomeExtensions.compiz-alike-magic-lamp-effect
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.wintile-windows-10-window-tiling-for-gnome
    gnome.gnome-tweaks
    inputs.nix-software-center.packages.${system}.nix-software-center

	    
    #video player
    celluloid

    #zsh
    starship
    
    #ide 
    vscodium
    direnv
    
    #task-manager
    mission-center
     
    #browser
    firefox      
  
    #themes
    whitesur-icon-theme
    whitesur-gtk-theme
    apple-cursor
    
   
    #libraries
    ntfs3g
    linuxHeaders
    linux-firmware
    fakeroot
    alsa-utils
    alsa-firmware
    gjs
   
    #utilities
    pywal
    killall
    pamixer
    brightnessctl
    upower
    streamlink
    wget
    unzip
    time
    socat
    rsync
    ripgrep
    fzf
    neofetch
    mpc-cli
    mlocate
    inotify-tools
    groff
    ffmpegthumbnailer
    jellyfin-ffmpeg
    fd
    dialog
    bat
    which
    poppler_utils
    p7zip
    atool
    unrar
    odt2txt
    xlsx2csv
    jq
    mediainfo
    imagemagick
    libnotify
    
    #virtual machines
    # virt-manager
    # spice spice-gtk
    # spice-protocol
    # win-virtio
    # win-spice
  ];

  fonts.packages = with pkgs; [
    font-awesome
    iosevka
    noto-fonts-cjk-sans
    jetbrains-mono
    nerdfonts
    cascadia-code
  ];

  # #virtmanager
  # programs.dconf.enable = true;
  # virtualisation = {
  #   libvirtd = {
  #     enable = true;
  #     qemu = {
  #       swtpm.enable = true;
  #       ovmf.enable = true;
  #       ovmf.packages = [ pkgs.OVMFFull.fd ];
  #     };
  #   };
  #   spiceUSBRedirection.enable = true;
  # };
  # services.spice-vdagentd.enable = true;  
}
