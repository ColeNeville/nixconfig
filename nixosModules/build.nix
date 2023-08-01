{ lib, ... }: {
  options.custom.imageAttribute = lib.mkOption {
    type = lib.types.str;
  };
}