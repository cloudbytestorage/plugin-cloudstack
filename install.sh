#!/bin/bash
echo "creating a backup dir @ /usr/share/cloudstack-management/backup"
mkdir /usr/share/cloudstack-management/backup

echo "taking backup of old js files : system.js and docs.js"
cp /usr/share/cloudstack-management/webapps/client/scripts/system.js  /usr/share/cloudstack-management/backup/
cp /usr/share/cloudstack-management/webapps/client/scripts/docs.js  /usr/share/cloudstack-management/backup/
cp /usr/share/cloudstack-management/webapps/client/scripts/ui/dialog.js  /usr/share/cloudstack-management/backup/

echo "taking backup of old js files : system.js.gz and docs.js.gz"
mv /usr/share/cloudstack-management/webapps/client/scripts/system.js.gz  /usr/share/cloudstack-management/backup/
mv /usr/share/cloudstack-management/webapps/client/scripts/docs.js.gz  /usr/share/cloudstack-management/backup/
mv /usr/share/cloudstack-management/webapps/client/scripts/ui/dialog.js.gz  /usr/share/cloudstack-management/backup/

echo "taking backup of cloudbyte plugin jar"
mv /usr/share/cloudstack-management/webapps/client/WEB-INF/lib/cloud-plugin-storage-volume-cloudbyte-4.5.1.jar /usr/share/cloudstack-management/backup/

echo "copying cloudbyte given system.js, docs.js, dialog.js and cloud-plugin-storage-volume-cloudbyte-4.5.1.jar"
cp ./system.js /usr/share/cloudstack-management/webapps/client/scripts/
cp ./docs.js /usr/share/cloudstack-management/webapps/client/scripts/
cp ./dialog.js /usr/share/cloudstack-management/webapps/client/scripts/ui/
cp ./cloud-plugin-storage-volume-cloudbyte-4.5.1.jar /usr/share/cloudstack-management/webapps/client/WEB-INF/lib/

echo "restart cloudstack management server"
cloudstack-setup-management
