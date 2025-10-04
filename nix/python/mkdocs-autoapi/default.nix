{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  mkdocs,
  mkdocstrings-python,
}:

buildPythonPackage rec {
  pname = "mkdocs-autoapi";
  version = "0.4.1";
  pyproject = true;

  src = fetchPypi {
    pname = "mkdocs_autoapi";
    inherit version;
    hash = "sha256-Pqc8ZjYRJK/qgCSlyy1oG42IwxN7as/tb+MeEfe4z4U=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    mkdocs
    mkdocstrings-python
  ];

  pythonImportsCheck = [
    "mkdocs_autoapi"
  ];

  meta = {
    description = "MkDocs plugin providing automatic API reference generation";
    homepage = "https://pypi.org/project/mkdocs-autoapi/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
