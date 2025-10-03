{ inputs, pkgs, ... }:
{
  # imports = [
  #   # inputs.nix-flatpak.flatpaks.homeManagerModules.nix-flatpak
  #   inputs.nix-flatpak.nixosModules.nix-flatpak
  # ];

  services.flatpak = {
    enable = true;
    # remotes = [
    #   {
    #     name = "flathub-beta";
    #     # location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    #     location = "https://mirror.sjtu.edu.cn/flathub";
    #   }
    # ];
    # packages = [
    #   "com.wps.Office"
    # ];
  };

  # systemd.services.flatpak-repo = {
  #   wantedBy = [ "multi-user.target" ];
  #   path = [ pkgs.flatpak ];
  #   script = ''
  #     flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  #   '';
  # };
}
