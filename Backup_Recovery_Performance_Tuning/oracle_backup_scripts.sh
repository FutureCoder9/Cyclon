# File 1: Steps to Fix Issues (Recreating Container)

# Issue Description:
# The original Docker container was created without any volume mounts, 
# preventing RMAN from storing backup files in a persistent location. 
# This resulted in backups failing due to the missing directory '/backup/rman_backups'. 
# Without a proper backup location, database recovery would be impossible in case of failure. 
# To resolve this, we need to recreate the container with a proper volume mount.

# Commit the existing container to a new image
docker commit oracle-container oracle_cyclon_image

# Stop the existing container
docker stop oracle-container

# Remove the existing container
docker rm oracle-container

# Create a new container with volume mount
docker run -d \
  -p 1521:1521 \
  -v C:\data\oracle_backups:/backup/rman_backups \
  --name oracle_cyclon_container \
  oracle_cyclon_image

# Verify the setup
docker exec -it oracle_cyclon_container bash
ls -l /backup/rman_backups

---

# File 2: RMAN Backup Steps

# Backup Instructions for Cyclon Project
# This document provides step-by-step instructions for configuring RMAN to back up the Cyclon database.
# Follow these steps to ensure your data is safely backed up and recoverable.

# Connect to the RMAN utility
rman target /

# Configure RMAN for automatic control file backup
CONFIGURE CONTROLFILE AUTOBACKUP FORMAT FOR DEVICE TYPE DISK TO '/backup/rman_backups/%F';
CONFIGURE CONTROLFILE AUTOBACKUP ON;

# Perform a full database backup including archive logs
BACKUP DATABASE PLUS ARCHIVELOG;

# Monitor Backup Location
# Verify that backup files are created in the mounted directory inside the container
ls -l /backup/rman_backups

# Confirm that the backup files are also visible on your host machine at:
# C:\data\oracle_backups

# Performance Tuning (Optional)
# Enable Parallelism: Use multiple channels to speed up backups
CONFIGURE DEVICE TYPE DISK PARALLELISM 2; 
BACKUP DATABASE PLUS ARCHIVELOG;

# Adjust Redo Log Sizes: Optimize redo log sizes to reduce checkpoint frequency during backups.

# Compression: Use RMAN compression to reduce backup size
BACKUP AS COMPRESSED BACKUPSET DATABASE PLUS ARCHIVELOG;

# Exit RMAN
EXIT;

# Confirmation Message (Optional)
echo "Backup completed successfully."

# Notes
# - Ensure that Docker is running and that the oracle_cyclon_container container is active.
# - Regularly schedule this process or automate it using a cron job or Task Scheduler.
# - Store backups offsite or in cloud storage for additional safety.
