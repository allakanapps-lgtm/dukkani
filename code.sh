#!/data/data/com.termux/files/usr/bin/bash
# usage: bash ~/dukkani/code.sh DEVICE-ID   -> prints the activation code for the Dukkani app
KEY="${CHEF_KEY:-$HOME/allakan-chef-private.pem}"
ID=$(echo "$1" | tr -d ' -' | tr a-z A-Z); PACK="${2:-d1}"
SIG=$(printf '%s' "$ID|$PACK" | openssl dgst -sha256 -sign "$KEY" | base64 -w0 | tr '+/' '-_' | tr -d '=')
echo "$PACK-$SIG"
