{ lib
, stdenv
, autoPatchelfHook 
, fetchurl
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
  name = "cake-wallet";
  version = "4.18.2";
  system = "x86_64-linux";

  src = 
    if stdenv.hostPlatform.system == system then
      fetchurl {
        url = "https://github.com/cake-tech/cake_wallet/releases/download/v4.18.2/Cake_Wallet_v${version}_Linux.tar.xz";
        sha256 = "73db49b6a844b28f3dd70cfb8a195cd42bd5ae1739b17422ed6541c447418267";
      }
    else throw "${name} is not supported on ${stdenv.hostPlatform.system}";


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

  unpackPhase = "tar xf ${src}";

  # Extract and copy executable in $out
  installPhase = ''
    mkdir -p $out/bin
    cp -ar Cake_Wallet_v${version}_Linux/* $out/bin
  '';

  meta = with lib; {
    homepage = "https://cakewallet.com/";
    description = "Store, send and exchange crypto";
    license = licenses.mit;
    platforms = [ system ];
  };
}
