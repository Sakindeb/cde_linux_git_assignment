#!/bin/bash

SOURCE_DIR="/Users/mac/files"
DEST_DIR="./json_and_CSV"

mkdir -p $DEST_DIR
mv $SOURCE_DIR/*.csv $DEST_DIR/
mv $SOURCE_DIR/*.json $DEST_DIR/

echo "All CSV and JSON files have been moved to $DEST_DIR."
