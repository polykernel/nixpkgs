{ lib
, aiohttp
, buildPythonPackage
, fetchFromGitHub
, paho-mqtt
, pydantic
, pythonOlder
}:

buildPythonPackage rec {
  pname = "yolink-api";
  version = "0.0.5";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "YoSmart-Inc";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-LCdPg+T6GMcE8NF32caWgC5lnaN7KOj2gZA/JHPcZKI=";
  };

  propagatedBuildInputs = [
    aiohttp
    paho-mqtt
    pydantic
  ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [
    "yolink"
  ];

  meta = with lib; {
    description = "Library to interface with Yolink";
    homepage = "https://github.com/YoSmart-Inc/yolink-api";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
