{
  self,
  nixpkgs,
  home-manager,
  ...
}:

home-manager.lib.homeManagerConfiguration {
  modules = [
    ./home.nix
  ];
  pkgs = import nixpkgs {
    system = "x86_64-linux";
    config.allowUnfree = true;
    overlays = self.nixpkgsOverlays;
  };
}