# export-from-keycloak

## 3. `SAME_FILE`

**Exports all users from all realms**

Realms and users are exported as a JSON file in directory `same-file`

```bash
./same-file.sh
```

A default _export directory path_ `/tmp/export-from-keycloak` is defined in the script

```bash
ls -al /tmp/export-from-keycloak/same-file
```

You can export to an alternative path by providing it as an argument

```bash
./same-file.sh "/alternative-path"
```

In which case realms and users are exported to directory `same-file` on that path

```bash
ls -al /alternative-path/same-file
```
