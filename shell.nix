{
  system ? builtins.currentSystem,
  pins ? import ./nix/npins,
  nixpkgs ? import pins.nixpkgs { inherit system; },
}:
let
  pkgs = nixpkgs.appendOverlays [
    (import ./nix/python)
  ];
  python = pkgs.python3.withPackages (ps: [
    ps.mkdocs
    ps.mkdocs-api-autonav
  ]);
in
pkgs.mkShell {
  nativeBuildInputs = [
    python
  ];

  NPINS_DIRECTORY = "./nix/npins/";

  shellHook = ''
  if [ -z "$PYTHONPATH" ]
    then export PYTHONPATH=$(realpath ./src)
    else export PYTHONPATH=$(realpath ./src):$PYTHONPATH
  fi
  '';
}
