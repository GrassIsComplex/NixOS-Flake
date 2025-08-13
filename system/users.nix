{ config, lib, pkgs, ... }:

{

	users.users = {
		grass = {
			isNormalUser = true;
			shell = pkgs.fish;
			extraGroups = [ 
				"wheel"
				"libvirtd" 
			];
			packages = with pkgs; [  ];
		};
	};

}
