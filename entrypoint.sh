#!/bin/bash
set -e

if [ -z "$1" ]; then
    certs_dir=/certs
    webroot=/webroot
    if [ ! -d "$certs_dir" ]; then
        echo "certs dir does not exist"
        exit 1
    fi
    if [ ! -d "$webroot" ]; then
        echo "webroot dir does not exist"
        exit 1
    fi
    if [ -z "$CERTBOT_DOMAINS" ]; then
        echo "The CERTBOT_DOMAINS environment variable is not set."
        exit 1
    fi
    if [ -z "$CERTBOT_EMAIL" ]; then
        echo "The CERTBOT_EMAIL environment variable is not set."
        CERTBOT_EMAIL=" --register-unsafely-without-email "
    else
        CERTBOT_EMAIL=" -m $CERTBOT_EMAIL "
    fi
    for DOMAIN in $CERTBOT_DOMAINS
    do
        exec certbot certonly --webroot -n -w "$webroot" -d "$DOMAIN" "$CERTBOT_EMAIL"
    done
    exec cp -rfu /etc/letsencrypt/live/* "$certs_dir"
else
    exec "$@"
fi
