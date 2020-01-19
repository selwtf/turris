#!/usr/bin/env bash
set -e

echo "Installing selwtf repository"

echo "Adding selwtf to Turris updater lists"
curl -o /etc/updater/keys/sel.release.pub https://raw.githubusercontent.com/selwtf/turris/master/toolchain/install/sel.release.pub
curl -o /etc/updater/keys/sel.standby.pub https://raw.githubusercontent.com/selwtf/turris/master/toolchain/install/sel.standby.pub
echo 'Repository("selwtf","https://storage.googleapis.com/sel-wtf-turris/omnia", {verification="sig", ocsp=false, pubkey="file:///etc/updater/keys/selwtf.release.key"})' > /etc/updater/conf.d/selwtf.lua

echo "Adding selwtf to opkg package feeds"
cp /etc/updater/keys/sel.release.pub /etc/opkg/keys/ccc6cfbacaa5e8b
cp /etc/updater/keys/sel.standby.pub /etc/opkg/keys/57e5e1f8717bb7fc
echo "src/gz selwtf https://storage.googleapis.com/sel-wtf-turris/omnia" >> /etc/opkg/customfeeds.conf

echo "All done! You might have to update your package lists before you can see the new packages."
