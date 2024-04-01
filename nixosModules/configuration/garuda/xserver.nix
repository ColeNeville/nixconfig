{ ... }:

{
  config = {
    services = {
      xserver = {
        enable = true;
        
        videoDrivers = ["modesetting"];

        libinput = {
          enable = true;

          touchpad = {
            naturalScrolling = true;
            clickMethod = "buttonareas";
          };
        };

        digimend.enable = true;
        wacom.enable = true;

        displayManager = {
          lightdm.enable = true;
        };

        windowManager = {
          qtile = {
            enable = true;
            extraPackages = python3Packages: with python3Packages; [
              psutil
            ];
          };
        };
      };
    };
  };
}
