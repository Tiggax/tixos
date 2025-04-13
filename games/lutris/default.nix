{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		(lutris.override {
			extraPkgs = pkgs: [
				gamescope
				winetricks
				wineWowPackages.stable
			];
			extraLibraries = pkgs: [
				
			];
		})
	];
}
