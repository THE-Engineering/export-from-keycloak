#!/bin/sh

export_path=${1-"/tmp/export-from-keycloak"}

rm -rf "$export_path/different-files" 2> /dev/null
mkdir -p "$export_path/different-files"

echo "​"
echo ✨
echo -e "\033[0;93mStarting\033[0m export"
echo "​"

timeout 24h \
  /opt/jboss/keycloak/bin/standalone.sh \
    -Djboss.socket.binding.port-offset=100 \
    -Dkeycloak.migration.action=export \
    -Dkeycloak.migration.provider=dir \
    -Dkeycloak.migration.dir="$export_path/different-files" \
    -Dkeycloak.migration.usersExportStrategy=DIFFERENT_FILES \
  > "$export_path/different-files.log" &

export_timeout="${!}"

until grep -m 1 "Export finished successfully" < "$export_path/different-files.log"
do
  sleep 2
done

kill ${export_timeout}

echo "​"
echo -e "Export is \033[0;93mcomplete\033[0m!"
echo 🎉
echo "​"

exit 0
