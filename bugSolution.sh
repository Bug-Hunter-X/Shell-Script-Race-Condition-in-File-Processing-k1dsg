#!/bin/bash

# This script uses xargs to avoid the race condition

find . -type f -print0 | xargs -0 -P 0 -I {} sh -c 'process_file {}'

process_file() {
  file=$1
  echo "Processing: $file"
  sleep 1
}
