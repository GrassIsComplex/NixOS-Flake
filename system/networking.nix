{ config, lib, pkgs, ... }:

{

	networking = {
		hostName = "nixos";

		wireless.enable = false;
		firewall.enable = true;
		networkmanager.enable = true;

		# Open ports in the firewall.
		#firewall.allowedTCPPorts = [ ... ];
		#firewall.allowedUDPPorts = [ ... ];
	};
}
