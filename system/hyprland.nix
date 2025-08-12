{ pkgs, lib, ... }:
{
	security.polkit.enable = true;

	xdg.portal = {
		enable = true;
		wlr.enable = false;
		xdgOpenUsePortal = false;
		extraPortals = [
			pkgs.xdg-desktop-portal-hyprland
			pkgs.xdg-desktop-portal-gtk
		];
	};

	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
		portalPackage = pkgs.xdg-desktop-portal-hyprland;
	};

	programs.thunar = {
		enable = true;
		plugins = with pkgs.xfce; [
			thunar-archive-plugin 
			thunar-volman
		];
	};

	environment.systemPackages = with pkgs; [
		hyprpaper
		kitty
		libnotify
		brightnessctl
		hyprpicker
		wl-clipboard
		waybar
		fuzzel
		qt5.qtwayland
		qt6.qtwayland
		wl-clipboard
	];
}
