# Zinn-o-Matics' vcpkg-registry

The vcpkg registry to add additional packages used by projects from Zinn-o-Matics.

Add the following to your `vcpkg-configuration.json`:
```json
"registries": [
  {
    "kind": "git",
    "repository": "https://github.com/Zinn-o-Matics/vcpkg-registry",
    "baseline": "<CommitHash>",
    "packages": [ "arcdps-extension" ]
  }
]
```
