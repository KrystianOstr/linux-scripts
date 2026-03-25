#!/bin/bash

print_menu() {
  echo "Wybierz opcje:"
  echo "1. Sprawdź listę dysków i partycji"
  echo "2. Sprawdź użycie systemu plików"
  echo "3. Sprawdź użycie konkretnego katalogu"
  echo "4. Sprawdź wysoki poziom zajętości - powyżej 80%"
  echo "0. Wyjdź"
  echo "Podaj numer opcji:"
}

show_disks() {
  echo
  echo "Uruchamianie komendy 'lsblk'..."
  lsblk
}

show_usage() {
  echo "Uruchamianie komendy 'df -h'..."
  df -h

}

check_directory() {
  echo
  echo "Podaj ścieżkę którą chcesz sprawdzić"

  read -r user_path

  echo "Ścieżka którą chcesz sprawdzić to $user_path"

  if [[ -d "$user_path"  ]]; then
    echo "Uruchamianie komendy 'du -sh'..."
    du -sh "$user_path"
  else
    echo "Ścieżka nie istnieje"
  fi
}

check_if_usage_is_more_than_80_percent() {
  echo
  echo "Sprawdzanie dysków z uzyciem większym niż 80%"

  echo "Lista dysków:"
  df -h | awk '$5 +0 > 80'
}

while true; do

print_menu


read -r user_choice

case "$user_choice" in
  0)
    echo "Zamykanie..."
    break
    ;;
  1)
    show_disks
    ;;
  2)
    show_usage
    ;;
  3)
    check_directory
    ;;
  4)
    check_if_usage_is_more_than_80_percent
    ;;
  *)
    echo "Podaj jedną z poprawnych opcji."
  esac

  echo

done

exit 0