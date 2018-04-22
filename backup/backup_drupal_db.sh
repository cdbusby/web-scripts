#!/bin/bash

# 
# backup_drupal_db.sh
# Version: 0.0.1
# Author: Colin Busby
# Website: https://www.colinbusby.com
#
 
# *********************************** #

#
# Requirements:
# - Drush (https://www.drush.org/)
# - gzip
#

# *********************************** #

#
# Script settings
#

# Create filename based on today's day
NOW=$(date +"%Y-%m-%d")
FILE="backup-drupal-$NOW.sql"

# Set path to Drush
WP_PATH=/usr/local/bin/

# Set path to project webroot
PROJECT_ROOT=/var/www/web/

# Set path to backups folder (where backup will be exported to)
BACKUPS_FOLDER=/home/web/backups/

# Full path of export
FULL_PATH=$BACKUPS_FOLDER$FILE

#
# Backup wordpress database
#
echo "Backing up data database..."

# cd to project folder and run drush sql-dump
cd $PROJECT_ROOT
${WP_PATH}drush sql-dump --result-file=$FULL_PATH --gzip

# done!
echo "Backup complete!"