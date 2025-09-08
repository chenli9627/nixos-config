{ pkgs, inputs, ... }:

let
  zenRelease = "beta"; # beta, twilight, twilight-official
in
{
  imports = [ inputs.zen-browser.homeModules.${zenRelease} ];

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
    # profiles."default" = {
    #   id = 0;
    #   isDefault = true;
    # };
  };
}
