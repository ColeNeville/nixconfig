{nixpkg-unstable, ...}:

{
  environment.systemPackages =
    with nixpkgs-unstable; [
      brave
      discord
    ]
}