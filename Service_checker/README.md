# Service Status Checker (Bash)

## Description

Simple Bash script for checking whether selected Linux services exist and whether they are currently running.

The script loops through a predefined list of services, verifies if each service is installed on the system, and then checks its current status.
Useful for practicing Bash scripting, loops, conditionals, and basic service monitoring.

---

## Features

* Check multiple services from a predefined list
* Verify whether a service exists on the system
* Show whether a service is running or stopped
* Display a message for services that do not exist
* Use `systemctl` for service inspection

---

## How to run

```bash
chmod +x service_status_checker.sh
./service_status_checker.sh
```

---

## Example usage

```bash
./service_status_checker.sh
```

Example output:

```text
ssh : running
nginx : stopped
cron : running
Service: janusz doesn't exist

Script has finished
```

---

## What I learned

* Working with Bash arrays
* Looping through values with `for`
* Checking conditions with `if`
* Using `systemctl list-unit-files` to verify service existence
* Using `systemctl is-active` to check service status
* Displaying clear status messages in CLI scripts
