{
  pkgs,
  defaultPackages,
  ...
}: (
  pkgs.mkShell {
    buildInputs =
      (with pkgs; [
        git
        gnumake
        home-manager
      ])
      ++ defaultPackages;
  }
)
