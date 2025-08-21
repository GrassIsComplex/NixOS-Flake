{ pkgs, ... }:
{
	services = {
		# Enable SSH service
		openssh.enable = true;

		# Configure Avahi
		avahi = {
			enable = true;
			nssmdns4 = true;
			publish = {
				enable = true;
				addresses = true;
			};
		};

		# Enable flatpak
		flatpak.enable = true;

		# Enable the X11 windowing system.
		xserver.enable = true;

		# Mount, trash, and other functionalities
		gvfs.enable = true;

		# Thumbnail support for images
		tumbler.enable = true;

		# Set sddm as the display manager
		displayManager.ly.enable = true;

		# Bluetooth
		blueman.enable = true;

		# Configure keymap in X11
		xserver.xkb.layout = "us";
		xserver.xkb.options = "caps:escape";

		# Enable CUPS to print documents.
		printing.enable = true;

		# Enable sound.
		pipewire = {
			enable = true;
			pulse.enable = true;
		};

		# Enable touchpad support
		libinput.enable = true;

		tailscale.enable = true;
	};
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
		settings = {
			General = {
				Experimental = true; # Show battery charge of Bluetooth devices
			};
		};
	};
}
