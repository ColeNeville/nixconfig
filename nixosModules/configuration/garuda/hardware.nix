{ ... }:

{
  config = {
    hardware = {
      opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;

        extraPackages = with pkgs; [
          vaapiVdpau
          libvdpau-va-gl
        ];
      };

      pulseaudio.enable = false;
      bluetooth.enable = true;
      sane.enable = true; # Document Scanner
      keyboard.qmk.enable = true;

      sensor = {
        iio.enable = true; # Ambient Light Sensor
      };
    };
  };
}
