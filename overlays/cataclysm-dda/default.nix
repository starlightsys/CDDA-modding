{
  pkgs,
  lib,
  cataclysmDDA,
  ...
}:
let
  patchedCDDA = (cataclysmDDA.git.tiles.override {
    version = "2024-08-12-2352";
    rev = "12bb7dae9bf15c6526ead63009569378086dedba";
    sha256 = "sha256-wc2f62fCoDw+tz43HzmwnmgAjh2T6ggp5r1WGX8luIo=";
  }).overrideAttrs (oldAttrs: {
    patches = [
      ./locale-path.patch
      ./no-whining.patch
    ];
  });
  customMods =
    self: super:
    lib.recursiveUpdate super {
      mod.No_Roaches = pkgs.cataclysmDDA.buildMod {
        modName = "No_Roaches";
        version = "0.1.2";
        src = pkgs.fetchFromGitHub {
          owner = "starlightsys";
          repo = "No_Roaches";
          rev = "a8fbb6d0bcdea7dd5a5e552fa383aa3396c1f793";
          hash = "sha256-EsF4wT3irvJ1AnDVkx8pEkrdkPhxtncgBTEgTQ7jckQ=";
        };
      };
      mod.TargetedMutagens = pkgs.cataclysmDDA.buildMod {
        modName = "TargetedMutagens";
        version = "0.1.0";
        src = pkgs.fetchFromGitHub {
          owner = "Standing-Storm";
          repo = "TargetedMutagens";
          rev = "e574bf75f5eab1f1bcacac280f244f791929c2b7";
          hash = "sha256-21+WC5nJEJ49Xv/EtzEaoZbFCPIs6mGC4dnEtiMaIQw=";
        };
      };
    };
  myCDDA =
    let
      inherit (cataclysmDDA) attachPkgs pkgs;
    in
    (attachPkgs pkgs patchedCDDA).withMods (
      mods:
      (with mods; [ tileset.UndeadPeople ])
      ++ (with mods.extend customMods; [
        mod.No_Roaches
        mod.TargetedMutagens
      ])
    );
in
myCDDA
