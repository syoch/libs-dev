{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/25.05";

  inputs.roboenv.url = "path:/mnt/data/ghq/github.com/syoch/libs-dev/libs/roboenv-nix";

  outputs =
    { roboenv, ... }:
    let
      rpkgs = roboenv.packages.x86_64-linux;
    in
    {
      packages.x86_64-linux = rpkgs;
      devShells.x86_64-linux.default = roboenv.devShells.x86_64-linux.default;
    };
}
