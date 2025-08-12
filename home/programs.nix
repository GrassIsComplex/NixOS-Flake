{ pkgs, pkgs-unstable, lib, inputs, ... }:
{
	programs = {
		git = {
			enable = true;
			userName = "GrassIsComplex";
			userEmail = "eneandresioan@gmail.com";
		}; 
		vesktop = {
			enable = true;
			vencord.settings = {
				autoUpdate = true;
				autoUpdateNorification = false;
				disableMinSize = true;
				plugins = {
					MessageLogger = {
						enabled = true;
						ignoreSelf = true;
					};
					FakeNitro.enabled = true;
					GameActivityToggle.enabled = true;
				};
			};
		};
		lutris = {
			enable = true;
			runners = {
				#cemu.package = pkgs.cemu;
			};
		};
	};
	
	home.packages = with pkgs; [
		blender
		gimp
		orca-slicer
		fastfetch
	];
}
