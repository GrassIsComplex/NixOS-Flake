{ pkgs, ... }:
{
	services = {
		ollama = {
			enable = true;
			acceleration = "rocm";
			environmentVariables = {
				OLLAMA_HOST= "0.0.0.0:11434";
			};
		};
	};
}
