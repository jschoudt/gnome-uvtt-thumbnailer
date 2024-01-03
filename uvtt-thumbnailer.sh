#!/bin/bash

# uvtt files are json files. The base map image is in a JSON field "image" which is the base 64 encoded image in PNG or WEBP format.

in_file="$1"
size="$2"
out_file="$3"

echo "$out_file"

jq -r '.image' "${in_file}" | base64 -d - | convert - -thumbnail "${size}x${size}>" "${out_file}"