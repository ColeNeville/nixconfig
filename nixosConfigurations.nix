inputs @ {
  self,
  nixpkgs,
  ...
}: let
in {
  # alexander-4 = import ./alexander-4 inputs;

  bahamut = self.lib.nixosSystem {
    system = "x86_64-linux";
    name = "bahamut";
  };

  garuda = self.lib.nixosSystem {
    system = "x86_64-linux";
    name = "garuda";
  };
}
