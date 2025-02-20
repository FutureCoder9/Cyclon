# File 2 : RMAN Backup Steps

# Connect to the RMAN utility
rman target /

# Configure RMAN for automatic control file backup
CONFIGURE CONTROLFILE AUTOBACKUP FORMAT FOR DEVICE TYPE DISK TO '/backup/rman_backups/%F';
CONFIGURE CONTROLFILE AUTOBACKUP ON;

# Perform a full database backup including archive logs
BACKUP DATABASE PLUS ARCHIVELOG;

# Verify that backup files are created in the mounted directory
ls -l /backup/rman_backups
