# Backup Manager (Bash)

## Description

Simple CLI tool for creating and managing compressed backups on Linux systems.

The script allows creating `.tar.gz` archives, listing existing backups, removing selected files, and checking backup sizes.
Useful for practicing Bash automation and basic file management tasks.

---

## Features

* Create compressed backups from a selected file or directory
* Save backups with the current date in the filename
* Store archives in a dedicated `backups` directory
* List existing backup files
* Remove selected backups
* Show size of each backup
* Show total size of all backups
* Interactive menu (CLI-based)

---

## How to run

```bash
chmod +x backup_manager.sh
./backup_manager.sh
```

---

## Example usage

```bash
./backup_manager.sh
```

After running, you will see a menu:

```text
1. Create backup
2. Show backup list
3. Remove backup
4. Show backup sizes
0. Exit
```

---

## What I learned

* Creating archives with `tar`
* Working with files and directories in Bash
* Checking file existence and validating user input
* Using loops and `case` for interactive CLI tools
* Listing and removing files safely
* Calculating file sizes with `du`
* Extracting filenames with `basename`
* Using command substitution in Bash
