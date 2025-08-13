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
				pcsx2.package = pkgs.pcsx2;
				cemu.package = pkgs.cemu;
			};
		};
		neovim = {
			enable = true;
			plugins = with pkgs.vimPlugins; [
				lazy-nvim
				lazydev-nvim
				kanagawa-nvim
				nvim-lspconfig
				plenary-nvim
				telescope-nvim
				which-key-nvim
				blink-cmp
			];
		};
	};
	
	home.packages = with pkgs; [
		#LSP
		lua-language-server
		pyright
		rust-analyzer

		aseprite
		godot
		blender
		gimp
		orca-slicer
		fastfetch
	];
}
