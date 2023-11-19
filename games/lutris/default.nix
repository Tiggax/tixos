{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		lutris
		winetricks
		wineWowPackages.stable
	];
}
