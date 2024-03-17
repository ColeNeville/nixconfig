pkgs: let
  availableEmacsPackages = pkgs.emacsPackagesFor pkgs.emacs;
  emacsWithPackages = availableEmacsPackages.withPackages;

  emacsPackages = epkgs: [
    # Themes
    epkgs.modus-themes
    epkgs.material-theme
    epkgs.exotica-theme

    epkgs.ace-window
    epkgs.use-package
    epkgs.spacious-padding

    epkgs.which-key
    epkgs.neotree
    epkgs.helm
    
    epkgs.ledger-mode
    epkgs.lua-mode
    epkgs.nix-mode
  ];
in emacsWithPackages emacsPackages
