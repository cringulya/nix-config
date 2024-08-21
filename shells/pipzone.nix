{ pkgs ? import <nixpkgs> { } }:

(pkgs.buildFHSUserEnv {
  name = "pipzone";
  targetPkgs = pkgs: (with pkgs; [
    zlib
    sox
    (python3.withPackages (p: with p; [
      pip
      virtualenv
      pandas
      numpy
      scikit-learn
      anyqt
      torch
      torch-audiomentations
      torchaudio
      librosa
      xgboost
    ]))
  ]);
  runScript = "fish";
}).env
