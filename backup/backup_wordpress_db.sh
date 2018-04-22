#!/bin/bash

# 
# backup_wordpress_db.sh
# Version: 0.0.1
# Author: Colin Busby
# Website: https://www.colinbusby.com
#
 
# *********************************** #

#
# Requirements:
# - WP CLI (https://wp-cli.org/)
# - gzip
# - wp-cli.yml
#

# *********************************** #

#
# Script settings
#

# Create filename based on today's day
NOW=$(date +"%Y-%m-%d")
FILE="backup-wp-$NOW.sql"

# Set path to WP CLI
WP_PATH=/usr/local/bin/

# Set path to project (folder with wp-cli.yml)
PROJECT_ROOT=/var/www/

# Set path to backups folder (where backup will be exported to)
BACKUPS_FOLDER=/home/web/backups/

# Full path of export
FULL_PATH=$BACKUPS_FOLDER$FILE

#
# Backup wordpress database
#
echo "Backing up data database..."

# cd to project folder and run wp-cli export
cd $PROJECT_ROOT
${WP_PATH}wp db export --add-drop-table $FULL_PATH

# gzip backup
echo "Compressing dump..."

gzip $FULL_PATH

# done!
echo "Backup complete!"