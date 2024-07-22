{ lib
, stdenv
, autoPatchelfHook 
, at-spi2-atk
, cairo
, fontconfig
, gdk-pixbuf
, glib
, gtk3
, harfbuzz
, libepoxy
, libgcc
, libgcrypt
, libgpg-error
, libuuid
, lz4
, pango
, xz
}:

stdenv.mkDerivation rec {
  pname = "cake-wallet-${version}";

  lib = ./lib;
  data = ./data;
  src = ./cake_wallet;
  version = "4.18.2";
  system = "x86_64-linux";

  # Required for compilation
  nativeBuildInputs = [
    autoPatchelfHook 
  ];

  # Required at running time
  buildInputs = [ 
    at-spi2-atk
    cairo
    fontconfig.lib
    gdk-pixbuf
    glib
    gtk3
    harfbuzz
    libepoxy
    libgcc
    libgcrypt
    libgpg-error
    libuuid
    lz4
    pango
    xz
  ];

  unpackPhase = ":";

  # Extract and copy executable in $out/bin
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/${pname}
    chmod +x $out/bin/${pname}
    cp -rav $lib $out/bin/lib
    cp -rav $data $out/bin/data
  '';

  meta = with stdenv.lib; {
    description = "Cake Wallet";
    platforms = [ "x86_64-linux" ];
  };
}
