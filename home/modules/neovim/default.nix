{ pkgs, ... }:

{
  stylix.targets.neovim.enable = false;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = with pkgs; [
      lua5_1
      imagemagick
      ruff
      lua-language-server
      stylua
      prettierd
      luarocks
      tree-sitter
      texlab
      nil
      marksman
      pyright
      nixpkgs-fmt
      jdt-language-server
      tinymist
      cmake-language-server
      typescript-language-server
    ];
  };
}
