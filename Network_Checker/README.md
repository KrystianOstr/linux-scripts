# Network Checker (Bash)

## Description

Simple CLI tool for checking basic network information and connectivity on Linux systems.

The script allows displaying IP addresses and interfaces, testing internet access, checking connectivity to a selected host, and showing listening ports.
Useful for practicing Bash scripting and basic network troubleshooting tasks.

---

## Features

* Show IP addresses and network interfaces using `ip a`
* Check internet connectivity with `ping`
* Check connectivity to a selected host
* Show listening ports using `ss`
* Validate user input before running checks
* Interactive menu (CLI-based)

---

## How to run

```bash
chmod +x network_checker.sh
./network_checker.sh
```

---

## Example usage

```bash
./network_checker.sh
```

After running, you will see a menu:

```text
1. Show IP addresses and interfaces
2. Check internet connection
3. Check connection to selected host
4. Show listening ports
0. Exit
```

---

## What I learned

* Using `ip a` to inspect network interfaces
* Using `ping` to test connectivity
* Using `ss` to inspect listening ports
* Validating user input in Bash
* Building interactive CLI tools with functions, loops, and `case`
* Formatting command output with `awk`
