{ pkgs, ... }:
let
  zellij-autolock = pkgs.fetchurl {
    url = "https://github.com/fresh2dev/zellij-autolock/releases/latest/download/zellij-autolock.wasm";
    hash = "194fgd421w2j77jbpnq994y2ma03qzdlz932cxfhfznrpw3mdjb9";
  };
in
{
  programs.zellij = {
    enable = true;
    settings = {
      # theme = "gruvbox-dark";
      auto_start = false;
      theme = "catppuccin-macchiato";
      # default_layout = "compact";
      autolock = {
        location = "${zellij-autolock}";
        triggers = "nvim|vim|v|nv";
        watch_triggers = "fzf|zoxide|atuin|atac";
        watch_interval = "1.0";
      };
    };
  };
}
# ...
# autolock location="https://github.com/fresh2dev/zellij-autolock/releases/latest/download/zellij-autolock.wasm" {
#     triggers "nvim|vim|v|nv"  // Lock when any open these programs open. They are expected to unlock themselves when closed (e.g., using zellij.vim plugin).
#     watch_triggers "fzf|zoxide|atuin|atac"  // Lock when any of these open and monitor until closed.
#     watch_interval "1.0"  // When monitoring, check every X seconds.
# }
# ...
