pkgs: let
  availableEmacsPackages = pkgs.emacsPackagesFor pkgs.emacs;
  emacsWithPackages = availableEmacsPackages.withPackages;

  myConfigContents = builtins.readFile ./default.el;
  
  emacsPackages = epkgs:
    let
      packages = [
        epkgs.ledger-mode
        epkgs.nix-mode

        epkgs.which-key
        epkgs.treemacs
        epkgs.helm

        epkgs.zenburn-theme
      ];

      myConfig = epkgs.trivialBuild {
        pname = "my-config";
        src = pkgs.writeText "default.el" myConfigContents;
        version = "0.1";
        packageRequires = packages;
      };
    in packages ++ [ myConfig ];
in emacsWithPackages emacsPackages
