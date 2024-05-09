#!/bin/bash

# Define the directories where Terraform caches are stored
cache_directories=(
  "$HOME/.terraform.d/plugin-cache"
  "$HOME/.terraform.d/plugins"
)

# Iterate over each directory and delete its contents
for directory in "${cache_directories[@]}"; do
  if [ -d "$directory" ]; then
    echo "Deleting contents of directory: $directory"
    rm -rf "$directory"/*
  else
    echo "Directory not found: $directory"
  fi
done

echo "Terraform cache cleanup complete"

