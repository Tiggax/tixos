{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		lutris
		gamescope
		winetricks
		wineWowPackages.stable
	];
}
