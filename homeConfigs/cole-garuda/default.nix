{
  self,
  nixpkgs,
  home-manager,
  ...
}: let
  system = "x86_64-linux";
  pkgs = self.pkgs.${system};
in (
  home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    
    modules = [
      ./home.nix
    ];
  }
)
