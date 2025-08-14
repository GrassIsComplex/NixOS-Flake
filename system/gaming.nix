{ pkgs, ... }:
{
	hardware.graphics = {
		## amdvlk: an open-source Vulkan driver from AMD
		extraPackages = [ pkgs.amdvlk ];
		extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
	};
	programs = {
		steam = {
			enable = true;

			remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
			dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
			localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers

			gamescopeSession.enable = true; # Year of the linux desktop fr fr
		};
		gamescope.enable = true;
		
	};
	environment.systemPackages = with pkgs; [
		steam-run
		wine
		winetricks
		wineWowPackages.stable
	];
}
