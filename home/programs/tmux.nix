{pkgs,...}:{programs.tmux = {
enable = true;
aggressiveResize = true;
keyMode = "vi";
mouse = true;
shell = "${pkgs.fish}/bin/fish";
shortcut = "a";

};
}
