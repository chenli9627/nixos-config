{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "chenli9627";
    userEmail = "chenli9627@gmail.com";
    # settings = {
    #   user.email = "chenli9627@gmail.com";
    #   user.name = "chenli9627";
    # };
  };
}
