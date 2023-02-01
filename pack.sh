#!/usr/bin/env sh
if ! command -v jq > /dev/null 2>&1; then
  echo "Error: jq is not installed. Please install it before running this script."
  exit 1
fi

jq --compact-output --slurp 'map(. + {"id": (input_filename | sub(".json$"; "") | sub("^services/"; ""))})' services/*.json > services.json
