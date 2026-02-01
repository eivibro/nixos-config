final: prev: {
  darktable = prev.darktable.overrideAttrs (old: rec {
    version = "5.4.0";

    src = prev.fetchurl {
      url = "https://github.com/darktable-org/darktable/releases/download/release-${version}/darktable-${version}.tar.xz";
      hash = "sha256-K/C66njSeUXPCcM9iATxeeA6g+4Z0ukn/WYOpGrKOxY=";
    };

    # Optional: keep in case you want to tweak flags later
    # cmakeFlags = old.cmakeFlags ++ [
    #   "-DSOME_NEW_FLAG=ON"
    # ];
  });
}
