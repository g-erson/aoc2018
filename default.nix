{ mkDerivation, base, http-conduit, optparse-applicative, stdenv
, text
}:
mkDerivation {
  pname = "aoc2018";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base http-conduit optparse-applicative text
  ];
  license = stdenv.lib.licenses.bsd3;
}
