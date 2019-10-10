#!/bin/bash

# add wget
apt-get update -yqq && apt-get -f install -yyq wget

FILE=/tmp/scripts/install-php-extensions.sh
if [ -f "$FILE" ]; then
  cp /tmp/scripts/install-php-extensions.sh /usr/local/bin/install-php-extensions
else
# download helper script
# @see https://github.com/mlocati/docker-php-extension-installer/
wget -q -O /usr/local/bin/install-php-extensions https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions \
    || (echo "Failed while downloading php extension installer!"; exit 1)
fi
# install extensions
chmod uga+x /usr/local/bin/install-php-extensions && sync && install-php-extensions \
    opcache \
    xdebug \
    mysqli \
    pdo_mysql \
    bz2 \
    bcmath \
    redis \
;