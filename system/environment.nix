{ pkgs, ... }:
{
	environment = {
		sessionVariables = rec {
			XDG_CACHE_HOME  = "$HOME/.cache";
			XDG_CONFIG_HOME = "$HOME/.config";
			XDG_DATA_HOME   = "$HOME/.local/share";
			XDG_STATE_HOME  = "$HOME/.local/state";
			XDG_BIN_HOME    = "$HOME/.local/bin";
			PATH = [ 
				"${XDG_BIN_HOME}"
			];
		};

		systemPackages = with pkgs; [
			# Coding
			gnumake
			cmake
			rustup
			zig
			raylib
			
			# Misc
			gh
			busybox
			pwvucontrol
			nwg-look
			nix-search
			openssl
			fzf
			lm_sensors
			zip
			unzip
			rar
			htop
			tree
			neovim
			vim
			wget
		];
	};
}
