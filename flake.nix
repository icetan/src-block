{
  description = "Expand embedded shell commands in text files";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };
  outputs = { nixpkgs, ... }: let
    overlay = import ./.;
    overlays = { default = overlay; };

    call = system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = builtins.attrValues overlays;
        };
      in
      rec {
        inherit (pkgs) src-block;
        default = src-block;
      };

    packages = builtins.foldl'
      (acc: system: acc // { ${system} = call system; })
      { }
      [ "aarch64-darwin" "aarch64-linux" "i686-linux" "x86_64-darwin" "x86_64-linux" ];
  in {
    inherit packages overlays;
  };
}
