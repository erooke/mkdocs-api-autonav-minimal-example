final: prev: {
  pythonPackagesExtensions = (prev.pythonPackagesExtensions or [ ]) ++ [
    (python-final: python-prev: {
      mkdocs-autoapi = python-final.callPackage ./mkdocs-autoapi { };
      mkdocs-api-autonav = python-final.callPackage ./mkdocs-api-autonav { };
    })
  ];
}
