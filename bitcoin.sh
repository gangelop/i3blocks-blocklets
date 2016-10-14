#!/usr/bin/env bash

bitcoinity_url="http://bitcoinity.org/markets/bitstamp/USD"
api_url="https://www.bitstamp.net/api/ticker/"

[ "$BLOCK_BUTTON" = "1" ] && xdg-open "$bitcoinity_url"

out="$(curl -s "$api_url")"

if [ $? -ne 0 ]; then
    echo "error"
    echo "error"
    echo "#ff0000"
    exit 0
fi

printf "%s" "$out" | awk -v RS="," '
/last/ {
    gsub("\"", "")
    print "$"$2
}
'
