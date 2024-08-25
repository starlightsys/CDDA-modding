{
  pkgs,
  lib,
  cataclysmDDA,
  ...
}:
let
  patchedCDDA = (cataclysmDDA.git.tiles.override {
    version = "backports-2024-08-25-1927";
    rev = "5006d0de948c77dd73fcc46c4cb655f8a70b0b33";
    sha256 = "sha256-gPqYom8keEzKbQmpV3Qcxmxd1SJ4b5a6fkOcash3phs=";
  }).overrideAttrs (oldAttrs: {
    patches = [
      ./patches/locale-path.patch
      ./patches/no-whining.patch
      ./patches/backports/0001-Active-grenades-don-t-spawn-as-duds.patch
      ./patches/backports/0002-MoM-Nether-void-edits-75654.patch
      ./patches/backports/0003-clean-up-deagle-conversion-kits.patch
      ./patches/backports/0004-feat-fema-camp-granularity.patch
      ./patches/backports/0005-Update-otherworldly-measuring-device.patch
      ./patches/backports/0006-Arrays.patch
      ./patches/backports/0007-AmmoTypes.patch
      ./patches/backports/0008-AmmoFixes.patch
      ./patches/backports/0009-Apply-suggestions-from-code-review.patch
      ./patches/backports/0010-Apply-suggestions-from-code-review.patch
      ./patches/backports/0011-Apply-suggestions-from-code-review.patch
      ./patches/backports/0012-Apply-suggestions-from-code-review.patch
      ./patches/backports/0013-Apply-suggestions-from-code-review.patch
      ./patches/backports/0014-Update-talk_tags.json.patch
      ./patches/backports/0015-Update-talk_tags.json.patch
      ./patches/backports/0016-Volume-Adjusting.patch
      ./patches/backports/0017-Fixes.patch
      ./patches/backports/0018-Update-doc-POSTAPOC_PRICE_GUIDE.md.patch
      ./patches/backports/0019-Update-data-json-snippets-newspapers.json.patch
      ./patches/backports/0020-TypoFixes.patch
      ./patches/backports/0021-DictionaryTypos.patch
      ./patches/backports/0022-Initial-commit.patch
      ./patches/backports/0023-Allow-operand-number-formats-on-g-14.patch
      ./patches/backports/0024-Make-debug-Mjollnir-unbreakable.patch
      ./patches/backports/0025-fungal-infected-ferals-have-lower-speed.patch
      ./patches/backports/0026-Espadrilles-are-not-armor.patch
      ./patches/backports/0027-Prevent-segfault-when-refitting-item-in-spillable-co.patch
      ./patches/backports/0028-Superglue-audit-75682.patch
      ./patches/backports/0029-Update-mutations.json.patch
      ./patches/backports/0030-Update-bungalow04.json.patch
      ./patches/backports/0031-Sky-Island-Add-Warped-Pond-craft-75713.patch
      ./patches/backports/0032-fix-desert-region-mod.patch
      ./patches/backports/0033-unbeetle-the-woodlouse.patch
      ./patches/backports/0034-CR-Possibility-to-fix-experimental-cyborgs-at-Rubic-.patch
      ./patches/backports/0035-capitalize-the-thingies.patch
      ./patches/backports/0036-Routine-i18n-updates-on-17-August-2024.patch
      ./patches/backports/0037-Fix-recoil-75748.patch
      ./patches/backports/0038-Remove-Gyroscopic-Stabilizer-75749.patch
      ./patches/backports/0039-Exclude-PARROT-special-attack-from-danger-calculatio.patch
      ./patches/backports/0040-Allow-speech-to-be-relearnt-in-the-dark.patch
      ./patches/backports/0041-TropiCata-Flying-bird-audit-75769.patch
      ./patches/backports/0042-Enchantments-can-affect-monster-luminance.patch
      ./patches/backports/0043-Update-bird.json.patch
      ./patches/backports/0044-Magiclysm-Update-Restore-Genetic-Stability-biomancer.patch
      ./patches/backports/0045-untool-the-wool.patch
      ./patches/backports/0046-Category-changes-for-a-few-items-75720.patch
      ./patches/backports/0047-Adds-the-1911-22-75783.patch
      ./patches/backports/0048-Allow-cephalopods-to-eat-sleep-underwater.patch
      ./patches/backports/0049-Return-to-always-treating-hostile-NPCs-as-being-dang.patch
      ./patches/backports/0050-desert_region-fix-too-high-weight-blacklist-meadow-a.patch
      ./patches/backports/0051-Telescopic-Eyes-cbm-will-cancel-mesopic-mutation.patch
      ./patches/backports/0052-Redo-superglue-description-75745.patch
      ./patches/backports/0053-Prevent-crash-from-1-array-idx-when-searching-zones.patch
      ./patches/backports/0054-Some-nested-recipe-fixes-75701.patch
      ./patches/backports/0055-Fixes-Genetic-Chaos-gaining-perks-75637.patch
      ./patches/backports/0056-EOD-helmet-radio-is-fixed-75553.patch
      ./patches/backports/0057-Update-mutations.json-75475.patch
      ./patches/backports/0058-Xedra-Evolved-Dream-wounds-Shadows-74678.patch
      ./patches/backports/0059-Update-tropical_reptile_amphibian.json-75807.patch
      ./patches/backports/0060-Update-monstergenerator.cpp-75804.patch
      ./patches/backports/0061-move-recipe_deconstruction.json-to-the-uncraft-folde.patch
      ./patches/backports/0062-Added-validation-of-mapgen-weight-75770.patch
      ./patches/backports/0063-add-rocks-to-drystone-recipes.patch
      ./patches/backports/0064-Remove-flu-shots-from-bathrooms-and-kitchen-tongs-fr.patch
      ./patches/backports/0065-fix-wont_hit_friend-75760.patch
      ./patches/backports/0066-Homullus-alchemy-75714.patch
      ./patches/backports/0067-Monster-vision-enchantment-and-evaluation-75753.patch
      ./patches/backports/0068-Prevent-using-invalidated-explosion-data-75711.patch
      ./patches/backports/0069-EOC-Support-string-user-input-in-EOC-similar-to-num_.patch
      ./patches/backports/0070-Support-for-multiple-weighted-field-sprite-variants-.patch
      ./patches/backports/0071-Fix-fatigue-sfx-id-75539.patch
      ./patches/backports/0072-Genericize-vehicle-handling-for-characters-no-specia.patch
      ./patches/backports/0073-get_driver-can-return-nullptr.patch
      ./patches/backports/0074-NPC-support-for-engine-starting-activity.patch
      ./patches/backports/0075-Downgrade-functional-changes-to-FIXMEs-continue-assu.patch
      ./patches/backports/0076-Silly-override-hack-for-tests.patch
      ./patches/backports/0077-AR-Pistol-Audit-75757.patch
      ./patches/backports/0078-Added-flags-and-melee-nerf-in-fishing.json-75638.patch
      ./patches/backports/0079-Extend-search-radius-for-Exodii-base-in-Find-Source-.patch
      ./patches/backports/0080-No-Summoned-Undead-corpse.patch
      ./patches/backports/0081-Weekly-Changelog-2024-08-12-to-2024-08-19-75811.patch
      ./patches/backports/0082-Prevent-crash-from-negative-array-index-for-visibili.patch
      ./patches/backports/0083-Allow-explosions-outside-of-the-reality-bubble-75567.patch
      ./patches/backports/0084-add-eoc-effect-and-condition-that-searches-weighed-a.patch
      ./patches/backports/0085-Add-itemgroup-field-that-activate-spawned-item-75663.patch
      ./patches/backports/0086-Prevent-segfault-when-deconstructing-improvised-shel.patch
      ./patches/backports/0087-move-them-all-75820.patch
      ./patches/backports/0088-American-Spelling-75734.patch
      ./patches/backports/0089-MoM-Convert-Lifting-Hand-to-power-give-Telekinetics-.patch
      ./patches/backports/0090-Give-zombie-prisoner-variants-their-full-name-75839.patch
      ./patches/backports/0091-overmap-granularity-audit-Industrial-buildings.patch
      ./patches/backports/0092-Neverending-problems-with-disassembly-75722.patch
      ./patches/backports/0093-MoM-Check-vitamins-not-powers-for-concentration-brea.patch
      ./patches/backports/0094-Update.patch
      ./patches/backports/0095-migrate-miner-hat-to-hard-hat-with-flashlight-75844.patch
      ./patches/backports/0096-MOM-Add-teleportation-ephemeral-walk-power-75867.patch
      ./patches/backports/0097-Audit-the-remaining-vanilla-birds-75779.patch
      ./patches/backports/0098-MOM-Add-Reality-Tear-Teleporter-Power-75876.patch
      ./patches/backports/0099-Update-mutations.json.patch
      ./patches/backports/0100-Initial-commit.patch
      ./patches/backports/0101-Initial-commit.patch
      ./patches/backports/0102-Add-forms.patch
      ./patches/backports/0103-Add-claw-bite-techniques.patch
      ./patches/backports/0104-Slightly-reduce-base-damage-from-natural-weapons.patch
      ./patches/backports/0105-Werewolves-are-carnivores-when-shapeshifted.patch
      ./patches/backports/0106-Add-massive-Visibility-and-Ugliness-to-War-Form-so-N.patch
      ./patches/backports/0107-Remove-unarmed-skill-bonus-add-Intimidate-bonus-pers.patch
      ./patches/backports/0108-Remove-bonus-melee-damage-enchant-damage-moved-to-na.patch
      ./patches/backports/0109-add-jack-o-lantern-byproducts.patch
      ./patches/backports/0110-Prevent-automatic-assignment-of-invlets-to-passive-m.patch
      ./patches/backports/0111-MoM-Add-PHASE_DISTANCE-to-Astral-Projection-75890.patch
      ./patches/backports/0112-MoM-Add-QD944-P-Mindsight-glasses-75855.patch
      ./patches/backports/0113-Fix-house_01-in-construction-house-variant.patch
      ./patches/backports/0114-Xedra-Evolved-Add-Homullus-must-wake-up-near-humans-.patch
      ./patches/backports/0115-Sky-Island-Make-bettter-security-containers-obtainab.patch
      ./patches/backports/0116-fail-to-feed-for-non-standard-mags-74696.patch
      ./patches/backports/0117-Made-human-products-get-human-vitamin-and-vitamin-in.patch
      ./patches/backports/0118-Update-generic.json.patch
      ./patches/backports/0119-Fix-density.patch
      ./patches/backports/0120-Update-38.json.patch
      ./patches/backports/0121-Run-make-style-json.patch
      ./patches/backports/0122-Add-missing-Draco-guns.patch
      ./patches/backports/0123-Run-make-style-json.patch
      ./patches/backports/0124-JSON-ify-sleep-affecting-mutations-trying-to-sleep-a.patch
      ./patches/backports/0125-make-the-option-to-have-salvaged-mk3-exos-repaired-a.patch
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
