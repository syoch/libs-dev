{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/25.05";

  inputs.libs-cmake.url = "path:/mnt/data/ghq/github.com/syoch/libs-dev/libs/libs-cmake";
  inputs.libs-cmake.inputs.nixpkgs.follows = "nixpkgs";

  inputs.static-mbed-os.url = "path:/mnt/data/ghq/github.com/syoch/libs-dev/libs/static-mbed-os";
  inputs.static-mbed-os.inputs.libs-cmake.follows = "libs-cmake";
  inputs.static-mbed-os.inputs.nixpkgs.follows = "nixpkgs";

  inputs.roboenv.url = "path:/mnt/data/ghq/github.com/syoch/libs-dev/libs/roboenv-nix";
  inputs.roboenv.inputs.nixpkgs.follows = "nixpkgs";
  inputs.roboenv.inputs.libs-cmake.follows = "libs-cmake";
  inputs.roboenv.inputs.static-mbed-os.follows = "static-mbed-os";

  inputs.N25A.url = "path:/mnt/data/ghq/github.com/syoch/libs-dev/NHK2025A";
  inputs.N25A.inputs.libs-cmake.follows = "libs-cmake";
  inputs.N25A.inputs.nixpkgs.follows = "nixpkgs";

  outputs =
    { roboenv, ... }:
    let
      system = "x86_64-linux";
      pkgs = import roboenv.inputs.nixpkgs { inherit system; };
      rpkgs = roboenv.packages.x86_64-linux;
      tpkgs = pkgs.callPackage ./tests {
        inherit (roboenv.packages.x86_64-linux) static-mbed-os-f446re;
        inherit (roboenv.lib) buildCMakeProject;
      };
    in
    {
      packages.x86_64-linux = rpkgs // tpkgs;
      devShells.x86_64-linux.default = roboenv.devShells.x86_64-linux.default;
    };
}
