{ lib, ... }:
{
  systemd.services.keyd.wantedBy = lib.mkForce [ ];
  services.keyd = {
    enable = true;
    keyboards = {
      # The name is just the name of the configuration file, it does not really matter
      default = {
        ids = [ "*" ]; # what goes into the [id] section, here we select all keyboards
        # Everything but the ID section:
        settings = {
          # The main layer, if you choose to declare it in Nix
          altmeta = {
            leftalt = "leftmeta";
            leftmeta = "leftalt";
            rightalt = "rightmeta";
          };
          main = {
            # capslock = "layer(control)"; # you might need to also enclose the key in quotes if it contains non-alphabetical symbols
            capslock = "overload(control, esc)";
            esc = "capslock";
            leftalt = "layer(altmeta)";
            rightalt = "layer(altmeta)";
            leftmeta = "layer(altmeta)";
          };
          otherlayer = { };
        };
        extraConfig = ''
          # put here any extra-config, e.g. you can copy/paste here directly a configuration, just remove the ids part
        '';
      };
    };
  };
}
