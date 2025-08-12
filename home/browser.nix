{ pkgs, firefox-addons, inputs, ...}:
{
	programs.librewolf = {
		enable = true;
		settings = {
			"webgl.disabled" = false;
			"privacy.resistFingerprinting" = false;
			"privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
			"sidebar.verticalTabs" = true;
			"browser.tabs.closeWindowWithLastTab" = false;
		};
	};
}
