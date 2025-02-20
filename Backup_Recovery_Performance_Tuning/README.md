# Backup, Recovery & Performance Tuning

This project contains scripts and techniques for **database backup**, **recovery**, and **performance tuning** in Cyclon.
## Backup : 

What I have Accomplished:

1)Configured RMAN: I have set up RMAN to back up your Oracle database, including the Cyclon schema.

2)Executed a Full Backup: I successfully executed a backup command that included:
   _The database itself.
   _The control file and SPFILE (automatically backed up by RMAN).
   
3) Verified Backup Files: You confirmed that the backup files were created and are accessible both inside the Docker container and on your host machine.

## 📂 Files
- `backup_scripts/`: Scripts for database backup.
- `recovery_scripts/`: Scripts for database recovery.
- `performance_tuning/`: Scripts and techniques for performance tuning.

---

## 🛠 How to Use
1. Navigate to the relevant folder (`backup_scripts/`, `recovery_scripts/`, or `performance_tuning/`).
2. Run the scripts as needed.

---

## 📄 License
This project is licensed under the MIT License. See [LICENSE](../LICENSE) for details.
