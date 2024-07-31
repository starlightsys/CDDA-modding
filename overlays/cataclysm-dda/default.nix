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
          rev = "f743c6b5891313a50f06b58ec393edc099f22fc0";
          hash = "sha256-6yNBWlDuuLLJZDnHDp2DkNydl/oCMVKKkcerXAzGFaM=";
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
