{
  pkgs ? import <nixpkgs> { },
}:
let
  yoctoEnv = (
    (builtins.fetchTarball {
      url = "https://github.com/nix-community/nix-environments/archive/master.tar.gz";
    })
    + "/envs/yocto/shell.nix"
  );
in
(import yoctoEnv) {
  inherit pkgs;
  extraPkgs = with pkgs; [
    nixfmt # Nix formatter
    just # Just
  ];
}
