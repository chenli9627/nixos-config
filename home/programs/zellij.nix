{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      # theme = "gruvbox-dark";
      auto_start = false;
      theme = "catppuccin-macchiato";
      # default_layout = "compact";
      autolock = {
        location = "builtin:autolock";
        triggers = "nvim|vim|v|nv";
        watch_triggers = "fzf|zoxide|atuin|atac";
        watch_interval = "1.0";
      };
    };
    plugins = [
      {
        name = "autolock";
        url = "https://github.com/fresh2dev/zellij-autolock/releases/latest/download/zellij-autolock.wasm";
      }
    ];
  };
}
# ...
# autolock location="https://github.com/fresh2dev/zellij-autolock/releases/latest/download/zellij-autolock.wasm" {
#     triggers "nvim|vim|v|nv"  // Lock when any open these programs open. They are expected to unlock themselves when closed (e.g., using zellij.vim plugin).
#     watch_triggers "fzf|zoxide|atuin|atac"  // Lock when any of these open and monitor until closed.
#     watch_interval "1.0"  // When monitoring, check every X seconds.
# }
# ...
