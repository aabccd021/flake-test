{
  outputs = { self, nixpkgs }:
    let

      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      gyatt = pkgs.writeShellScriptBin "gyatt" ''           
        echo gyatt
        echo gyatt
      '';
    in

    {

      devShells.x86_64-linux.default = pkgs.mkShellNoCC {
        buildInputs = with pkgs;[
          nixpkgs-fmt
        ];
      };

      packages.x86_64-linux.gyatt = gyatt;

      packages.x86_64-linux.default = gyatt;

    };
}
