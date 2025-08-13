{
	description = "NixOS flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

		home-manager.url = "github:nix-community/home-manager/release-25.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		flatpaks.url = "github:in-a-dil-emma/declarative-flatpak/stable-v3";
	};

	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, flatpaks, ... }@inputs:
	let 
		system = "x86_64-linux";
		pkgs = import nixpkgs {
			inherit system;
			config.allowUnfree = true;
		};
		pkgs-unstable = import nixpkgs-unstable {
			inherit system;
			config.allowUnfree = true;
		};
	in
	{
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [
				./system 
				home-manager.nixosModules.home-manager
				{
					home-manager.backupFileExtension = "backup";
					nixpkgs.config.allowUnfree = true;
					nixpkgs.config.allowUnfreePredicate = _:true;
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.extraSpecialArgs = {
						inherit pkgs;
						inherit flatpaks;
						inherit pkgs-unstable;
						inherit inputs;
					};
					home-manager.users.grass = import ./home;
				}
			];
			specialArgs = {
				inherit pkgs-unstable;
			};
		};
	};
}
