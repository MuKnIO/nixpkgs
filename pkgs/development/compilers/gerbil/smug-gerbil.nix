{ lib, fetchFromGitHub, ... }:

{
  pname = "smug-gerbil";
  version = "unstable-2024-03-21";
  git-version = "0.4.20-2-g4316dbb";
  softwareName = "Smug-Gerbil";
  gerbil-package = "drewc/smug";

  pre-src = {
    fun = fetchFromGitHub;
    owner = "drewc";
    repo = "smug-gerbil";
    rev = "4316dbb47bb402fedd81452b37ae766f3f1b8e81";
    sha256 = "14pc8pl63djwyig1nzjhcllgs1gm089b8gd4mcp98bc5gv0bacs5";
  };

  meta = with lib; {
    description = "Super Monadic Über Go-into : Parsers and Gerbil Scheme";
    homepage = "https://github.com/drewc/smug-gerbil";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
