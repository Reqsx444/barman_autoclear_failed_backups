***Barman Failed Backups Cleaner***
## Introduction
A Bash script that automates the detection and removal of FAILED PostgreSQL backups managed by Barman.
It scans for failed backups for a given server, removes their data from disk, logs the operation, and cleans up temporary files.

## Usage
### Prerequisites :
- Barman installed and configured
- Executable permission on the script:
- Proper path in the script to your Barman backup directory

## CRON
To run this script daily at 4:00 AM for server pg-main: </br>
0 4 * * * /path/to/barman_cleanup.sh -n pg-main
