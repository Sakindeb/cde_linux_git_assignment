#!/bin/bash

# Set environment variables (correct syntax)
export CSV_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
export RAW_DIR="./raw"
export TRANSFORMED_DIR="./transformed"
export GOLD_DIR="./gold"

# Start ETL process
echo "ETL process starting..."

# Create directories if they don't exist
mkdir -p "$RAW_DIR" "$TRANSFORMED_DIR" "$GOLD_DIR"

# Download the CSV file
wget -q -O "$RAW_DIR/source.csv" "$CSV_URL"

# Check if download was successful
if [ -f "$RAW_DIR/source.csv" ]; then
    echo "File downloaded successfully and saved to $RAW_DIR."
else
    echo "Unsuccessful download"
    exit 1
fi

# Perform transformation
awk -F',' 'NR==1{gsub(/Variable_code/, "variable_code")} {print $1 "," $2 "," $3 "," $5}' "$RAW_DIR/source.csv" > "$TRANSFORMED_DIR/2023_year_finance.csv"

# Check if transformation was successful
if [ -f "$TRANSFORMED_DIR/2023_year_finance.csv" ]; then
    echo "Transformation successful. File saved to $TRANSFORMED_DIR."
else
    echo "Transformation failed."
    exit 1
fi

# Load the file to the gold directory
cp "$TRANSFORMED_DIR/2023_year_finance.csv" "$GOLD_DIR/"

# Check if the file was successfully copied
if [ -f "$GOLD_DIR/2023_year_finance.csv" ]; then
    echo "File successfully copied to $GOLD_DIR."
else
    echo "Failed to copy the file."
    exit 1
fi

echo "ETL process completed successfully!"
