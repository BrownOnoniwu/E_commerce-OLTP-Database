#!/bin/bash

# MySQL Database Information
DB_USER="root"
DB_PASSWORD="MzE2OTAtYnJvd25v"
DB_NAME="sales"

# Path to the MySQL dump command (change if necessary)
MYSQLDUMP="/usr/bin/mysqldump"

# Output SQL file
OUTPUT_FILE="sales_data.sql"

# Check if the MySQL dump command is available
if ! command -v "$MYSQLDUMP" &> /dev/null; then
  echo "MySQL dump command is not available. Please check the path."
  exit 1
fi

# Perform the data export
"$MYSQLDUMP" -u"$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" sales_data > "$OUTPUT_FILE"

# Check if the export was successful
if [ $? -eq 0 ]; then
  echo "Data exported successfully to $OUTPUT_FILE."
else
  echo "Error exporting data. Please check the MySQL credentials and database."
fi
