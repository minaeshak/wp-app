#!/bin/bash

DB_NAME="your_database_name"
DB_USER="your_database_user"
DB_PASSWORD="your_database_password"
BACKUP_DIR="/path/to/backup/directory"
DATE=$(date +%F)
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-$DATE.sql"

mkdir -p $BACKUP_DIR

mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE

gzip $BACKUP_FILE

find $BACKUP_DIR -type f -name "*.gz" -mtime +7 -exec rm {} \;

echo "Backup completed and stored as $BACKUP_FILE.gz"
