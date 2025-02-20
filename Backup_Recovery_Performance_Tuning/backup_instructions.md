# Backup Instructions for Cyclon Project

This document provides step-by-step instructions for configuring RMAN to back up the Cyclon database. Follow these steps to ensure your data is safely backed up and recoverable.

---

## Configure RMAN for Backups

### 1. Connect to RMAN
Run the following command to connect to RMAN:

\``shell
rman target /
\``

### 2. Set Up Control File Autobackup Format
Configure RMAN to automatically back up the control file and SPFILE:

\``shell
CONFIGURE CONTROLFILE AUTOBACKUP FORMAT FOR DEVICE TYPE DISK TO '/backup/rman_backups/%F';
CONFIGURE CONTROLFILE AUTOBACKUP ON;
\``

### 3. Perform a Full Database Backup (Including Archived Logs)
Run the following command to perform a full backup of the database, including archived logs:

\``shell
BACKUP DATABASE PLUS ARCHIVELOG;
\``

---

## Monitor Backup Location

1. Verify that the backup files are created in the mounted directory inside the container:
\``shell
ls /backup/rman_backups
\``

2. Confirm that the backup files are also visible on your host machine at:
\``shell
C:\data\oracle_backups
\``

---

## Performance Tuning (Optional)

After backups are set up, consider optimizing performance using RMAN techniques:

1. **Enable Parallelism**:
Use multiple channels to speed up backups:
\``shell
CONFIGURE DEVICE TYPE DISK PARALLELISM 2;
BACKUP DATABASE PLUS ARCHIVELOG;
\``

2. **Adjust Redo Log Sizes**:
Optimize redo log sizes to reduce checkpoint frequency during backups.

3. **Compression**:
Use RMAN compression to reduce backup size:
\``shell
BACKUP AS COMPRESSED BACKUPSET DATABASE PLUS ARCHIVELOG;
\``

---

## Exit RMAN

After completing the backup, exit RMAN by running:

\``shell
EXIT;
\``

---

## Confirmation Message (Optional)

You can include a confirmation message in your script to indicate that the backup was completed successfully:

\``shell
echo "Backup completed successfully."
\``

---

### Notes

- Ensure that Docker is running and that the `oracle_cyclon_container` container is active.
- Regularly schedule this process or automate it using a cron job or Task Scheduler.
- Store backups offsite or in cloud storage for additional safety.

---

Save this file as `backup_instructions.md` in your GitHub repository under the `backup_scripts/` directory.
