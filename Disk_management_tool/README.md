# Disk Manager (Bash)

## Description

Simple CLI tool for checking disks, partitions, and filesystem usage on Linux systems.

The script provides quick access to basic storage-related commands such as listing disks, checking filesystem usage, analyzing directory size, and detecting filesystems with high usage.
Useful for practicing Bash scripting and basic Linux administration tasks.

---

## Features

* Show disks and partitions using `lsblk`
* Show filesystem usage using `df -h`
* Check size of a selected directory using `du -sh`
* Detect filesystems with usage above 80%
* Interactive menu (CLI-based)

---

## How to run

```bash
chmod +x disk_manager.sh
./disk_manager.sh
```

---

## Example usage

```bash
./disk_manager.sh
```

After running, you will see a menu:

```
1. Show disks and partitions
2. Show filesystem usage
3. Check selected directory usage
4. Show filesystems above 80% usage
0. Exit
```

---

## What I learned

* Using `lsblk` to inspect disks and partitions
* Using `df -h` to check filesystem usage
* Using `du -sh` to measure directory size
* Reading user input in Bash
* Building interactive CLI tools with functions, loops, and `case`
* Filtering command output with `awk`
