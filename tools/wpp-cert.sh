#!/bin/bash

if [ -z "$1" ]; then
    CERT="clientcert.pem"
else
    CERT=$1
fi
if [ -r "${CERT}" ]; then
    echo "Could not find certificate '${CERT}'!"
    exit
fi

