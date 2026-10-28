#!/data/data/com.termux/files/usr/bin/bash
# bash ~/dukkani/code.sh DEVICE-ID PACK [DAYS]
# PACK: mini(200 مادة) shop(1000) market(5000) big(بلا حد) d1(قديم=بلا حد) trial (DAYS default 7)
KEY="${CHEF_KEY:-$HOME/allakan-chef-private.pem}"
ID=$(echo "$1" | tr -d ' -' | tr a-z A-Z); PACK="${2:-big}"
if [ "$PACK" = trial ]; then PACK="trial$(date -d "+${3:-7} days" +%Y%m%d)"; fi
SIG=$(printf '%s' "$ID|$PACK" | openssl dgst -sha256 -sign "$KEY" | base64 -w0 | tr '+/' '-_' | tr -d '=')
echo "$PACK-$SIG"
