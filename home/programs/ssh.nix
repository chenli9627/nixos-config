{
  programs.ssh = {
    addKeysToAgent = "yes";
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "ssh.github.com";
        user = "git";
        port = 443;
      };
    };
  };
}
