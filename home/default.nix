{ flatpaks, config, pkgs, lib, inputs, ... }:
{

	home.username = "grass";
	home.homeDirectory = "/home/grass";
	home.stateVersion = "25.05";


	imports = [
		flatpaks.homeModule
		./flatpak.nix
		./programs.nix
		./browser.nix
		./config.nix
		./theme.nix
	];
}
