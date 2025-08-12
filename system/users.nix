{ config, lib, pkgs, ... }:

{

	users.users = {
		grass = {
			isNormalUser = true;
			extraGroups = [ 
				"wheel"
				"libvirtd" 
			];
			packages = with pkgs; [  ];
		};
	};

}
