#!/bin/sh

export_path=${1-"/tmp/export-from-keycloak"}

rm -rf "$export_path/realm-file" 2> /dev/null
mkdir -p "$export_path/realm-file"

echo "​"
echo ✨
echo -e "\033[0;93mStarting\033[0m export"
echo "​"

timeout 24h \
  /opt/jboss/keycloak/bin/standalone.sh \
    -Djboss.socket.binding.port-offset=101 \
    -Dkeycloak.migration.action=export \
    -Dkeycloak.migration.provider=singleFile \
    -Dkeycloak.migration.file="$export_path/realm-file/export-master.json" \
    -Dkeycloak.migration.realmName=master \
    -Dkeycloak.migration.usersExportStrategy=REALM_FILE \
  > "$export_path/realm-file/export-master.log" &

export_timeout="${!}"

until grep -m 1 "Export finished successfully" < "$export_path/realm-file/export-master.log"
do
  sleep 2
done

kill ${export_timeout}

timeout 24h \
  /opt/jboss/keycloak/bin/standalone.sh \
    -Djboss.socket.binding.port-offset=102 \
    -Dkeycloak.migration.action=export \
    -Dkeycloak.migration.provider=singleFile \
    -Dkeycloak.migration.file="$export_path/realm-file/export-THE.json" \
    -Dkeycloak.migration.realmName=THE \
    -Dkeycloak.migration.usersExportStrategy=REALM_FILE \
  > "$export_path/realm-file/export-THE.log" &

export_timeout="${!}"

until grep -m 1 "Export finished successfully" < "$export_path/realm-file/export-THE.log"
do
  sleep 2
done

kill ${export_timeout}

echo "​"
echo -e "Export is \033[0;93mcomplete\033[0m!"
echo 🎉
echo "​"

exit 0
