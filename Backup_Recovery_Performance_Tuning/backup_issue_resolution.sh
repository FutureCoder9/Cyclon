# File 1: Steps to Fix Issues (Recreating Container)

# Issue Description:
# The original Docker container was created without any volume mounts, 
# preventing RMAN from storing backup files in a persistent location. 
# This resulted in backups failing due to the missing directory '/backup/rman_backups'. 
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
