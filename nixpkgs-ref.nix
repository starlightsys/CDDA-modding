{ pkgs ? import (fetchTarball {
        narHash= "sha256-oedh2RwpjEa+TNxhg5Je9Ch6d3W1NKi7DbRO1ziHemA=";
        owner= "NixOS";
        repo= "nixpkgs";
        rev= "693bc46d169f5af9c992095736e82c3488bf7dbb";
      } )}:
      {}
