{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/25.05";

  inputs.roboenv.url = "path:/mnt/data/ghq/github.com/syoch/libs-dev/libs/roboenv-nix";
  inputs.roboenv.inputs.nixpkgs.follows = "nixpkgs";
  inputs.roboenv.inputs.libs-cmake.follows = "libs-cmake";

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
