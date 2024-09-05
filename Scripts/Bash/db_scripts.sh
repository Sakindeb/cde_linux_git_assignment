z#!/bin/bash

CSV_FILES_DIR="/Users/mac/Downloads/wetransfer_parch_posey_data_2024-08-28_2103"
DB_NAME="posey"
TABLE_NAME="data"

for file in $CSV_FILES_DIR/*.csv
do
    psql -d $DB_NAME -c "\COPY $TABLE_NAME FROM '$file' DELIMITER ',' CSV HEADER;"
    echo "File $file has been imported into $TABLE_NAME."
done
