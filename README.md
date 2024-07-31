Example overlay for cataclysm-dda that patches the game, adds the one predefined mod and adds a custom mod.

Working as of [nixpkgs rev 693bc46](https://github.com/NixOS/nixpkgs/tree/693bc46d169f5af9c992095736e82c3488bf7dbb).

## Test build

`./build.sh`

## NixOS flake

To include it in your flake, copy `overlays/` into your flake folder and call the package like this:

```nix
overlays = [
  (final: prev: {
    cataclysm-dda = prev.callPackage ./overlays/cataclysm-dda {};
  })
];
```

Note that the desktop item is probably going to point to the wrong executable, so I'd suggest copying or declaring `~/.local/share/applications/org.cataclysmdda.CataclysmDDA.desktop` with just `cataclysm-tiles` in the `Exec=` field.
