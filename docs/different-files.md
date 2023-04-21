# export-from-keycloak

## 1. `DIFFERENT_FILES`

**Exports all users from all realms**

Realms and users are exported as JSON files in directory `different-files`

```bash
./different-files.sh
```

A default _export directory path_ `/tmp/export-from-keycloak` is defined in the script

```bash
ls -al /tmp/export-from-keycloak/different-files
```

You can export to an alternative path by providing it as an argument

```bash
./different-files.sh "/alternative-path"
```

In which case realms and users are exported to directory `different-files` on that path

```bash
ls -al /alternative-path/different-files
```
