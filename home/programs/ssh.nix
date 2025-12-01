{
  programs.ssh = {
    # addKeysToAgent = "yes";
    enable = true;
    # matchBlocks = {
    #   "github.com" = {
    #     hostname = "ssh.github.com";
    #     user = "git";
    #     port = 443;
    #   };
    # };
    enableDefaultConfig = false;
    # matchBlocks = [
    #   {
    #     addKeysToAgent = "yes";
    #   }
    # ];
    # enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        # forwardAgent = false;
        addKeysToAgent = "yes";
        # compression = false;
        # serverAliveInterval = 0;
        # serverAliveCountMax = 3;
        # hashKnownHosts = false;
        # userKnownHostsFile = "~/.ssh/known_hosts";
        # controlMaster = "no";
        # controlPath = "~/.ssh/master-%r@%n:%p";
        # controlPersist = "no";
      };
      "github.com" = {
        hostname = "ssh.github.com";
        user = "git";
        port = 443;
      };
    };
  };
}
