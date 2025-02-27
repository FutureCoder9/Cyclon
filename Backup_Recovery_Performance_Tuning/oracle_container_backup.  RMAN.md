# Oracle Container Backup Summary

## Introduction

This document provides an overview of the backup process for the Oracle database running within a Docker container. The container is part of the Cyclon project and is accessed using SQL Developer.

## Environment Details

- **Container Name**: oracle-container
- **Database Version**: Oracle Database 23ai Free Release 23.0.0.0.0 - Develop, Learn, and Run for Free, Version 23.6.0.24.10
- **Docker Image**: oracle/database:19.3.0-se2
- **Connection Tool**: SQL Developer
- **Connection Name**: Cyclon

## Backup Process

1. **Backup Tool**: RMAN (Recovery Manager)
2. **Backup Type**: Full database backup
3. **Backup Location**: Inside the container at `/opt/oracle/product/23ai/dbhomeFree/dbs/`
4. **Backup Files**:
   - Datafile backups
   - Control file autobackup
   - SPFILE autobackup

## Backup Commands

```bash
docker exec -it oracle-container bash
rman target /
RMAN> backup database;


### Backup Output Logs
Connected to:
Oracle Database 23ai Free Release 23.0.0.0.0 - Develop, Learn, and Run for Free
Version 23.6.0.24.10



PS C:\Users\Hp> docker exec -it oracle-container bash
bash-4.4$ rman target / as sysdba

Recovery Manager: Release 23.0.0.0.0 - Production on Tue Feb 25 09:02:50 2025
Version 23.6.0.24.10

Copyright (c) 1982, 2024, Oracle and/or its affiliates.  All rights reserved.

connected to target database: FREE (DBID=1459905065)

RMAN> backup database;
Starting backup at 25-FEB-25
using target database control file instead of recovery catalog
allocated channel: ORA_DISK_1

Starting Control File and SPFILE Autobackup at 25-FEB-25
piece handle=/tmp/c-1459905065-20250225-00 comment=NONE
Finished Control File and SPFILE Autobackup at 25-FEB-25

