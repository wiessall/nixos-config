{ pkgs, inputs, self, ...}:
{
    firefox = {
      enable = true;
      languagePacks = [ "de" "en-US" ];
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
	EnableTrackingProtection = {
	  Value = true;
	  Cryptomining = true;
	  Fingerprinting = true;
	};
      };
      profiles.myprofile = {
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
      	    bitwarden
            consent-o-matic
    	    cookie-autodelete
    	    facebook-container
    	    i-dont-care-about-cookies
    #	Medium-Parser
            ublock-origin
    	    tridactyl
    	    zotero-connector
          ];
	 settings = {
          "widget.dmabuf.force-enabled" = true;
          "general.smoothScroll" = true;
          "widget.use-xdg-desktop-portal.file-picker" = 1; # Use KDE File Picker
          "extensions.autoDisableScopes" = 0; # Don't auto-disable extensions
          "app.update.auto" = false;

          # Telemetry
          "app.shield.optoutstudies" = false;

          # Addon Recommendations
          "browser.discovery.enabled" = false;
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;

          # Auto-decline cookies
          "cookiebanners.bannerClicking.enabled" = true;
          "cookiebanners.service.mode" = 1;
          "cookiebanners.service.mode.privateBrowsing" = 1;

          # Tracking
          "browser.contentblocking.category" = "strict";
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.pbmode.enabled" = true;
          "privacy.trackingprotection.emailtracking.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "privacy.trackingprotection.cryptomining.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;

          # Fingerprinting
          "privacy.fingerprintingProtection" = true;
          "privacy.resistFingerprinting" = true;
          "privacy.resistFingerprinting.pbmode" = true;

          # Query Tracking
          "privacy.query_stripping.enabled" = true;
          "privacy.query_stripping.enabled.pbmode" = true;

          # Phishing
          # Disables cross-origin sub-resources from opening HTTP authentication credentials dialogs
          "network.auth.subresource-http-auth-allow" = 1;
        };
        search.default = "DuckDuckGo";

       };
    };
}
