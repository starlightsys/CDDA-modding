{
  pkgs,
  lib,
  cataclysmDDA,
  ...
}:
let
  patchedCDDA = cataclysmDDA.stable.tiles.overrideAttrs (oldAttrs: {
    patches = oldAttrs.patches ++ [
      ./no-whining.patch
      ./helicopter-anarchy.patch
    ];
  });
  customMods =
    self: super:
    lib.recursiveUpdate super {
      mod.No_Roaches = pkgs.cataclysmDDA.buildMod {
        modName = "No_Roaches";
        version = "0.1.0";
        src = pkgs.fetchFromGitHub {
          owner = "starlightsys";
          repo = "No_Roaches";
          rev = "e5458cbd2c538bb9e72ddfb5a546d53830496614";
          hash = "sha256-SJT2voSyRHmpbDdrq4pJPZblJYf9/nIKBj8DpLyRPfY=";
        };
      };
    };
  myCDDA =
    let
      inherit (cataclysmDDA) attachPkgs pkgs;
    in
    (attachPkgs pkgs patchedCDDA).withMods (
      mods: (with mods; [ tileset.UndeadPeople ]) ++ (with mods.extend customMods; [ mod.No_Roaches ])
    );
in
myCDDA
