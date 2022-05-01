final: prev: with prev;

let
  mkBin = { name, script, buildInputs ? [] }:
    runCommand name { inherit buildInputs; } ''
      mkdir -p $out/bin
      cp ${script} $out/bin/${name}
      chmod +x $out/bin/${name}
      patchShebangs $out/bin
    '';
in {
  src-block = mkBin {
    name = "src-block";
    script = ./src-block;
    buildInputs = [ perl ];
  };
}
