{ inputs, ... }:

let
  zenRelease = "twilight"; # beta, twilight, twilight-official
in
{
  imports = [ inputs.zen-browser.homeModules.${zenRelease} ];

  programs.zen-browser = {
    enable = true;
    # profiles."default" = {
    #   id = 0;
    #   isDefault = true;
    # };
  };
}
