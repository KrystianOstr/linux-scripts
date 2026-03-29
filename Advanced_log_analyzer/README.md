# Advanced Log Analyzer (Bash)

## Description

Simple Bash script for generating a structured report from a log file.

The script validates the input file and then produces a summary with total log lines, log level counts, most common log levels, top source IPs, top users, and the most frequent error messages.
Useful for practicing Bash scripting, text processing, and basic log analysis tasks.

---

## Features

* Validate log file input before processing
* Count total number of log lines
* Count occurrences of `ERROR`, `INFO`, and `WARN`
* Show top log levels in the file
* Show most frequent source IP addresses
* Show most frequent users
* Show most common error entries
* Generate a simple CLI report

---

## How to run

```bash
chmod +x advanced_log_analyzer.sh
./advanced_log_analyzer.sh /path/to/logfile.log
```

---

## Example usage

```bash
./advanced_log_analyzer.sh sample.log
```

Example report sections:

```text
- summary
- top log levels
- top IPs
- top users
- top errors
```

---

## What I learned

* Validating file input in Bash
* Counting and filtering data with `awk`
* Extracting fields with `cut`
* Sorting and grouping values with `sort` and `uniq`
* Building simple text reports in Bash
* Working with structured log data from the command line
