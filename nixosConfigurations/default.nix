inputs @ {
  self,
  nixpkgs,
  ...
}: let
  nixosConfiguration = { system, name, ... }: let 
    pkgs = self.pkgs.${system};
  in (
    nixpkgs.lib.nixosSystem {
      inherit system pkgs;

      modules = [
        self.nixosModules.configuration-${name}
      ];
    }
  );
in {
  bahamut = import ./bahamut inputs;
  alexander-4 = import ./alexander-4 inputs;
  
  garuda = nixosConfiguration {
    system = "x86_64-linux";
    name = "garuda";
  };
}
