#!/bin/bash

log_file=$1

file_checker() {
  if [[ -z "$log_file" ]]; then
    echo "Error: no log file path provided."
    echo "Usage: ./advanced_log_analyzer.sh <log_file>"
    exit 1
  fi

  if [[ ! -e "$log_file" ]]; then
    echo "Error: file does not exist: $log_file"
    exit 1
  fi

  if [[ ! -f "$log_file" ]]; then
    echo "Error: path is not a regular file: $log_file"
    exit 1
  fi

  if [[ ! -r "$log_file" ]]; then
    echo "Error: file is not readable: $log_file"
    exit 1
  fi

  echo "Validation completed. Processing data..."
  echo
}

report() {
  echo "===== LOG ANALYSIS ====="
  echo "File: $log_file"
  echo "========================"


  echo "--- SUMMARY ---"
  total_lines=$(wc -l "$log_file" | awk '{print $1}')
  echo "Total lines: $total_lines"
  awk '$5 == "ERROR" {error_counter++} END {print "ERROR:", error_counter+0}' "$log_file"
  awk '$5 == "INFO" {info_counter++} END {print "INFO:", info_counter+0}' "$log_file"
  awk '$5 == "WARN" {warn_counter++} END {print "WARN:", warn_counter+0}' "$log_file"
  echo

  echo "--- TOP LOG LEVELS ---"
  cut -d ' ' -f 5 "$log_file" | sort | uniq -c | sort -nr | awk '{print $1,$2}'
  echo

  echo "--- TOP IP ---"
  cut -d ' ' -f 4 "$log_file" | sort | uniq -c | sort -nr | awk '{print $1,$2}'
  echo

  echo "--- TOP USERS ---"
  cut -d ' ' -f 3 "$log_file" | sort | uniq -c | sort -nr | awk '{print $1,$2}'
  echo

  echo "--- TOP ERRORS ---"
  # grep "ERROR" "$log_file" | cut -d ' ' -f 6- | sort | uniq -c | sort -nr | awk '{print $1,$2}'
  grep "ERROR" "$log_file" | cut -d ' ' -f 6- | sort | uniq -c | sort -nr
  echo
}

#FLOW

file_checker

report


exit 0