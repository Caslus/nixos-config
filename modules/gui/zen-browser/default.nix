{
  inputs,
  ...
}:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "zen-beta" ];
    "text/xml" = [ "zen-beta" ];
    "x-scheme-handler/http" = [ "zen-beta" ];
    "x-scheme-handler/https" = [ "zen-beta" ];
  };

  programs.zen-browser = {
    enable = true;

    profiles.default = {
      userChrome = builtins.readFile ./userChrome.css; # these are not working idk why
      userContent = builtins.readFile ./userContent.css;

      settings = {
        toolkit.legacyUserProfileCustomizations.stylesheets = true;
      };
    };

    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemtry = true;
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
  };
}
