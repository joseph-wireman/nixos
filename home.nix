{ config, pkgs, lib, ... }:

with lib.hm.gvariant;

{
 
  home.username = "joseph";
  home.homeDirectory = "/home/joseph";
  home.stateVersion = "23.05";
  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "joseph-wireman";
    userEmail = "joewireman7198@gmail.com";
  };

  

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    settings = {

      add_newline = false;
      command_timeout = 1000;
      format = "$os$username$hostname$kubernetes$directory$git_branch$git_status";
      
      character = {
        success_symbol = "";
        error_symbol = "";

      };

      os = {
        format = "[$symbol](bold white) ";
        disabled = false;
      };

      os.symbols = {
        Windows = "";
        Arch = "󰣇";
        Ubuntu = "";
        Macos = "󰀵";
      };

      username = {
        style_user = "white bold";
        style_root = "black bold";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };

      hostname = {
        ssh_only = false;
        format = "on [$hostname](bold yellow) ";
        disabled = false;
      };

      directory = {
        truncation_length = 1;
        truncation_symbol = "…/";
        home_symbol = "󰋜 ~";
        read_only_style = "197";
        read_only = "  ";
        format = "at [$path]($style)[$read_only]($read_only_style) ";

      };

      git_branch = {
        symbol = " ";
        format = "via [$symbol$branch]($style)";
        truncation_symbol = "…/";
        style = "bold green";
      };


      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
        style = "bold green";
        conflicted = "🏳";
        up_to_date = "";
        untracked = " ";
        ahead = "⇡\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        behind = "⇣\${count}";
        stashed = " ";
        modified = " ";
        staged = "[++\($count\)](green)";
        renamed = "襁 ";
        deleted = " ";

      };

      kubernetes = {
        format = "via [󱃾 $context\($namespace\)](bold purple) ";
        disabled = false;
      };

      vagrant = {
        disabled = true;
      };  

      docker_context = {
        disabled = true;
      };

      helm = {
        disabled = true;
      };
      
      python = {
        disable = true;
      };

      nodejs = {
        disable = true;
      };

      ruby = {
        disable = true;
      };
      
      terraform = {
        disable = true;
      };


    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
    };

    initExtra = ''
      (cat /home/joseph/.cache/wal/sequences &)
      eval "$(starship init zsh)"
    '';
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };

    theme = {
      name = "WhiteSur-Dark";
      package = pkgs.whitesur-gtk-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.sessionVariables.GTK_THEME = "WhiteSur-Dark";
  

  home.pointerCursor = 
    let 
      getFrom = url: hash: name: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          size = 26;
          package = 
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
              }} $out/share/icons/${name}
          '';
        };
    in
      getFrom 
        "https://github.com/ful1e5/apple_cursor/releases/download/v2.0.0/macOS-Monterey.tar.gz"
        "sha256-MHmaZs56Q1NbjkecvfcG1zAW85BCZDn5kXmxqVzPc7M="
        "macOS-Monterey";
}