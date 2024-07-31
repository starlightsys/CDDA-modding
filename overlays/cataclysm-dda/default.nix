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
          rev = "fbf221408e8267950d6c4971af7d69c638a3ed66";
          hash = "sha256-MJqlfrYmzVQcK9Mf5+jZXNbaqszKsB376imaZAs6IzY=";
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
