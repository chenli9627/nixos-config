{
  programs.ssh = {
    addKeysToAgent = "yes";
    matchBlocks = {
      "github.com" = {
        hostname = "ssh.github.com";
        user = "git";
        port = "443";
      };
    };
  };
}
