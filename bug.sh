#!/bin/bash

# This script attempts to process files in a directory,
# but it has a subtle race condition.

find . -type f -print0 | while IFS= read -r -d $'\0' file; do
  # Process each file
  echo "Processing: $file"
  # Simulate some processing time
  sleep 1
  #Here is a race condition if a new file is created while processing the other files 
  # this will cause the new file not to be processed
  # Solution: find . -type f -print0 | xargs -0 -P 0 -I {} sh -c 'process_file {}'
 done