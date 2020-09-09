#!/usr/bin/env bash
set -e

if [[ -z "${PKG_REPO}" ]]; then
    echo "PKG_REPO not set. Exiting."
    exit 1
fi
if [[ -z "${NEW_PKGS}" ]]; then
    echo "NEW_PKGS not set. Exiting."
    exit 1
fi
if [[ -z "${SIGN_KEY}" ]]; then
    echo "SIGN_KEY not set. Exiting."
    exit 1
fi
if [[ -z "${GCS_BUCKET}" ]]; then
    echo "GCS_BUCKET not set. Exiting."
    exit 1
fi


echo "Downloading current repository to $PKG_REPO"
gsutil -m rsync -r -d gs://${GCS_BUCKET}/ $PKG_REPO/ || exit 1

echo "Updating $PKG_REPO with packages from $NEW_PKGS"
cp -rf $NEW_PKGS/* $PKG_REPO || exit 1

echo "Recreating package index in $PKG_REPO"
cd $PKG_REPO && /ipkg-make-index.sh . > Packages &&\
cat Packages | gzip > Packages.gz &&\

echo "Signing package index in $PKG_REPO" &&\
usign -S -s $SIGN_KEY -m Packages || exit 1

echo "Upload current (updated) repository to gs://${GCS_BUCKET}"
gsutil -m rsync -r -d $PKG_REPO/ gs://${GCS_BUCKET}/
