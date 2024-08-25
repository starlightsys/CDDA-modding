{
  pkgs,
  lib,
  cataclysmDDA,
  ...
}:
let
  patchedCDDA = (cataclysmDDA.git.tiles.override {
    version = "5006d0de94";
    rev = "5006d0de948c77dd73fcc46c4cb655f8a70b0b33";
    sha256 = "sha256-gPqYom8keEzKbQmpV3Qcxmxd1SJ4b5a6fkOcash3phs=";
  }).overrideAttrs (oldAttrs: {
    patches = [
      ./patches/locale-path.patch
      ./patches/no-whining.patch
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
        version = "0.1.2";
        src = pkgs.fetchFromGitHub {
          owner = "starlightsys";
          repo = "TargetedMutagens";
          rev = "8f978d9b5c63b13bad8b2e0b9b295a7eadcca428";
          hash = "sha256-WYaGMDhn5p0+C8D6w5zICU87XzjYezS3uup7ayz7NzY=";
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
