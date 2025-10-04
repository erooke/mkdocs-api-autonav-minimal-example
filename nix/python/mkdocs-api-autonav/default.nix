{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatch-vcs,
  hatchling,
  mkdocs,
  mkdocstrings-python,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "mkdocs-api-autonav";
  version = "0.4.0";
  pyproject = true;

  src = fetchPypi {
    pname = "mkdocs_api_autonav";
    inherit version;
    hash = "sha256-NSew5c8baCvTdKPOaZrBLWKI9fyvk4d/NKaxTHl0Bjc=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    mkdocs
    mkdocstrings-python
    pyyaml
  ];

  pythonImportsCheck = [
    "mkdocs_api_autonav"
  ];

  meta = {
    description = "Autogenerate API docs with mkdocstrings, including nav";
    homepage = "https://pypi.org/project/mkdocs-api-autonav";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ];
  };
}
