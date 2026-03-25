# Log Analyzer (Bash)

## Description

Simple CLI tool for analyzing log files on Linux systems.

The script allows basic log inspection such as counting log levels, searching for keywords, and displaying recent entries.
Useful for quick troubleshooting and log exploration in a DevOps environment.

---

## Features

* Validate input log file (exists, readable, correct type)
* Count log levels:

  * ERROR
  * WARNING
  * INFO
* Show last 10 lines of the log file
* Search for a keyword in the log (with line numbers)
* Display only ERROR lines
* Interactive menu (CLI-based)

---

## How to run

```bash
chmod +x log_analyzer.sh
./log_analyzer.sh /path/to/logfile.log
```

---

## Example usage

```bash
./log_analyzer.sh /var/log/syslog
```

After running, you will see a menu:

```
1. Count ERROR, WARNING, INFO
2. Show last 10 lines
3. Search keyword
4. Show ERROR lines only
0. Exit
```

---

## What I learned

* Bash scripting structure (functions + main loop)
* Input validation (file checks, permissions)
* Working with logs using:

  * `grep`
  * `tail`
* User input handling (`read`)
* Building interactive CLI tools
* Using `case` and `while` loops
