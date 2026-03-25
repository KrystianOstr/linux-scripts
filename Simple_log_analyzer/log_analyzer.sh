#!/bin/bash

LOG_PATH=$1

validate_log_file() {
  if [[ -z "$LOG_PATH" ]]; then
      echo "Nie podano ścieżki do pliku"
      exit 1
  fi

  if [[ ! -e "$LOG_PATH" ]]; then
    echo "Plik nie istnieje"
    exit 1
  fi

  if [[ ! -f "$LOG_PATH" ]]; then
    echo "To nie jest plik"
    exit 1
  fi

  if [[ ! -r "$LOG_PATH" ]]; then
    echo "Brak praw do odczytu"
    exit 1
  fi
}

print_menu() {
    echo "========================="
    echo "         MENU"
    echo "========================="
    echo "1. Pokaż liczbę ERROR, WARNING, INFO"
    echo "2. Pokaż ostatnie 10 linii loga"
    echo "3. Wyszukaj słowo kluczowe w logu"
    echo "4. Pokaż tylko linie z błędami"
    echo "0. Wyjdź"
    echo "========================="
    echo "Wybierz opcję:"
}

count_log_levels() {
  echo "Czytam logi..."
  echo "========================="

  
  errors=$(grep -c "ERROR" "$LOG_PATH")
  warnings=$(grep -c "WARNING" "$LOG_PATH")
  infos=$(grep -c "INFO" "$LOG_PATH")

  echo "Liczba błędów: $errors"
  echo "Liczba ostrzeżeń: $warnings"
  echo "Liczba komunikatów typu INFO: $infos"
}

show_last_10_lines() {
  echo "Czytam logi..."
  echo "========================="
  echo "Lista ostatnich 10 linii: "
  
  tail -n 10 "$LOG_PATH"
}

search_keyword() {
  echo "Czytam logi..."
  echo "========================="
  echo "Podaj wyszukiwane słowo: "

  read -r user_word

  if [[ -z "$user_word" ]]; then
    echo "Proszę podać wyszukiwane słowo"
    return
  fi

  if grep -n "$user_word" "$LOG_PATH"; then
    :
  else
    echo "Brak logów z wyszukiwanym słowem"
  fi
}

show_lines_with_errors() {
  echo "Czytam logi..."
  echo "========================="

  if grep "ERROR" "$LOG_PATH"; then
    :
  else
    echo "Brak linii z błędami"
  fi
}

#FLOW

validate_log_file

while true; do
  print_menu
  read -r user_choice

  case "$user_choice" in
    0)
      echo "Zamykanie.."
      break
    ;;
    1)
    count_log_levels
    ;;
    2)
    show_last_10_lines
    ;;
    3)
    search_keyword
    ;;
    4)
    show_lines_with_errors
    ;;
    *)
      echo "Wybierz poprawna opcje"
    ;;
  esac

done

exit 0