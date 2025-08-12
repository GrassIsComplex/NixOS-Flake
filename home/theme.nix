{ pkgs, ... }:
{
	home.pointerCursor = {
		gtk.enable = true;
		x11.enable = true;
		name = "Bibata-Modern-Classic";
		package = pkgs.bibata-cursors;
		size = 24;
	};
	gtk = {
		enable = true;
		theme = {
			name = "Kanagawa-B";
			package = pkgs.kanagawa-gtk-theme;
		};
		iconTheme = {
			name = "Papirus-Dark";
			package = pkgs.papirus-icon-theme;
		};
	};
}
