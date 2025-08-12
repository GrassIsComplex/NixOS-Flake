let 
	config = ./config;
in
{
	home.file = {
		"Scripts/theme-switcher.sh".source = "${config}/theme-switcher.sh";
		".config/hypr".source = "${config}/hypr";
		".config/waybar".source = "${config}/waybar";
		".config/fastfetch".source = "${config}/fastfetch";
		".config/fuzzel.ini".source = "${config}/fuzzel.ini";
	};
}
