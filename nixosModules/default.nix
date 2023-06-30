{
  feature-auto-update = import ./feature/auto-update.nix;
  
  common = import ./common.nix;
  
  user-cole = import ./user/cole.nix;

  # Host specific user configurations
  user-garuda-cole = import ./user/garuda-cole.nix;
}