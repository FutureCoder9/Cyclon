

---

# **Backup, Recovery & Performance Tuning**  

This project contains scripts and techniques for database **backup, recovery, and performance tuning** in the **Cyclon** database.  

---

## **Backup**  

### ✅ **What Has Been Accomplished:**  
1. **Configured RMAN** – Set up RMAN to back up the Oracle database, including the **Cyclon schema**.  
2. **Executed a Full Backup** – Successfully performed a **full database backup**, including:  
   - The **database itself**  
   - The **control file and SPFILE** (automatically backed up by RMAN)  
3. **Verified Backup Files** – Confirmed that the backup files were successfully created and are accessible:  
   - **Inside the Docker container** (`/backup/rman_backups/`)  
   - **On the host machine** (`C:\data\oracle_backups\`)  

---

## **📂 Project Structure**  
This directory contains scripts for **backup, recovery, and performance tuning**.  

```
📂 Backup_Recovery_Performance_Tuning/
│── 📂 backup_scripts/        # Scripts for database backup  
│── 📂 recovery_scripts/      # Scripts for database recovery  
│── 📂 performance_tuning/    # Scripts & techniques for performance tuning  
│── 📄 README.md              # Documentation  
│── 📄 LICENSE                # License file  
```

---

## **🛠 How to Use**  

1. **Backup Scripts** – Navigate to `backup_scripts/` and execute RMAN backup commands.  
2. **Recovery Scripts** – Use `recovery_scripts/` for database **restore & recovery**.  
3. **Performance Tuning** – Optimize database performance using techniques in `performance_tuning/`.  

---

## **📄 License**  
This project is licensed under the **MIT License**. See [LICENSE](LICENSE) for details.  

---

This version improves readability, structure, and clarity while keeping it professional and concise. Let me know if you want any modifications! 🚀
