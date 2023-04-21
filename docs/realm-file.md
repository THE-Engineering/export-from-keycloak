# export-from-keycloak

## 2. `REALM_FILE`

**Exports two realms**

1. `master`
2. `THE`

Realms and users are exported as JSON files in directory `realm-file`

```bash
./realm-file.sh
```

A default _export directory path_ `/tmp/export-from-keycloak` is defined in the script

```bash
ls -al /tmp/export-from-keycloak/realm-file
```

You can export to an alternative path by providing it as an argument

```bash
./realm-file.sh "/alternative-path"
```

In which case realms and users are exported to directory `realm-file` on that path

```bash
ls -al /alternative-path/realm-file
```
