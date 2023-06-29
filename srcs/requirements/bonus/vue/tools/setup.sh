#!/bin/bash

KEYRING=/usr/share/keyrings/nodesource.gpg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | tee "$KEYRING" >/dev/null
gpg --no-default-keyring --keyring "$KEYRING" --list-keys
chmod a+r /usr/share/keyrings/nodesource.gpg

VERSION=node_16.x
KEYRING=/usr/share/keyrings/nodesource.gpg
DISTRO="bullseye"
echo "deb [signed-by=$KEYRING] https://deb.nodesource.com/$VERSION $DISTRO main" | tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src [signed-by=$KEYRING] https://deb.nodesource.com/$VERSION $DISTRO main" | tee -a /etc/apt/sources.list.d/nodesource.list

apt-get update
apt-get install nodejs -y

npm install -g npm@9.7.2

npm install

npm run build

cp -rf dist/* /var/www/bonus

npm run dev

exec "$@"