let 
	config = ./config;
in
{
	home.file = {
		".config/hypr".source = "${config}/hypr";
		".config/nvim".source = "${config}/nvim";
		".config/kitty".source = "${config}/kitty";
		".config/waybar".source = "${config}/waybar";
		".config/fastfetch".source = "${config}/fastfetch";
		".config/fuzzel.ini".source = "${config}/fuzzel.ini";
		".config/fish".source = "${config}/fish";
	};
}
