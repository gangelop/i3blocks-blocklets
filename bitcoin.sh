#!/usr/bin/env bash

# TODO: fail gracefully if curl fails (network issues)

bitcoinity_url="http://bitcoinity.org/markets/bitstamp/USD"
api_url="https://www.bitstamp.net/api/ticker/"

[ "$BLOCK_BUTTON" = "1" ] && xdg-open "$bitcoinity_url"

curl -s "$api_url" | awk -v RS="," '
/last/ {
    gsub("\"", "")
    print "$"$2
}
'
