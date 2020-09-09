#!/usr/bin/env bash
set -e

echo "Installing selwtf repository for container-optimized kernel"

echo "Adding selwtf repository to Turris updater lists"
curl -o /etc/updater/keys/selwtf.release.pub https://raw.githubusercontent.com/selwtf/turris/master/toolchain/install/sel.release.pub
curl -o /etc/updater/keys/selwtf.standby.pub https://raw.githubusercontent.com/selwtf/turris/master/toolchain/install/sel.standby.pub
echo 'Repository("selwtf","https://storage.googleapis.com/sel-wtf-turris/omnia/stable/packages", {verification=sig, ocsp=false, priority=60, pubkey="file:///etc/updater/keys/selwtf.release.pub"})' > /etc/updater/conf.d/selwtf-repo.lua
