#!/bin/bash

BACKUP_DIR="./backups"


if [[ ! -d "$BACKUP_DIR" ]]; then
  mkdir -p "$BACKUP_DIR"
fi

create_some_things_FOR_TESTING() {
  touch "${BACKUP_DIR}"/backup1.tar.gz
  touch "${BACKUP_DIR}"/backup2.tar.gz
  touch "${BACKUP_DIR}"/backup3
}

create_some_things_FOR_TESTING

print_menu() {
  echo
  echo "Jaką akcję chcesz wykonać?"
  echo "1. Zrób backup wskazanego katalogu"
  echo "2. Zobacz listę istniejących backupów"
  echo "3. Usuń wskazany backup"
  echo "4. Sprawdź rozmiar backupów"
  echo "0. Wyjść"
  echo "Wybierz opcję:"
}

create_backup() {
  echo "Podaj plik lub katalog do spakowania:"
  read -r source_path

  echo "Podaj nazwę archiwum:"
  read -r archive_name

  if [[ -n "$source_path" && -n "$archive_name" && -e "$source_path" ]]; then
    archive_name_with_date="${BACKUP_DIR}/${archive_name}_$(date +%F).tar.gz"
    
    
    echo "Robię backup '$source_path'"

    if tar -czf "$archive_name_with_date" "$source_path"; then
      echo "Backup utworzony: '$archive_name_with_date'"
    else
      echo "Błąd tworzenia backupu"
    fi
  else
    echo "Podaj poprawne wartości"
  fi
}

backup_list() {
  echo "Sprawdzam folder ${BACKUP_DIR}..."
  # ls -l "${BACKUP_DIR}"/*.tar.gz

  if ls -l "${BACKUP_DIR}"/*.tar.gz; then
    echo
  else
    echo "BRAK backupow"
  fi
}

remove_backup() {
  echo "Sprawdzam folder ${BACKUP_DIR}..."
  echo "Lista obecnych backupów"

  if ! ls "${BACKUP_DIR}"/*.tar.gz >/dev/null 2>&1; then
    echo "Brak backupów do usunięcia."
    return
  fi

  ls -l "${BACKUP_DIR}"/*.tar.gz

  echo "Podaj nazwę backupów które chcesz usunąć: "
  read -r backups_to_remove

  if [[ -n "$backups_to_remove" && -e "${BACKUP_DIR}/${backups_to_remove}" ]]; then
    echo "Usuwanie..."
    rm -f "${BACKUP_DIR}/${backups_to_remove}"
    echo "Usunięto."
  else
    echo "Błąd usuwania. Podano zły plik."
  fi
}

show_backup_size() {
  echo "Sprawdzam folder ${BACKUP_DIR}..."

  if ! ls "${BACKUP_DIR}"/*.tar.gz > /dev/null 2>&1; then
    echo "Brak backupów do wyświetlenia."
    return
  fi

  for backup_file in "${BACKUP_DIR}"/*.tar.gz; do
    backup_name=$(basename "$backup_file")
    backup_size=$(du -h "$backup_file" | awk '{print $1}')

    echo "${backup_name} - ${backup_size}"
  done

  total_backup_size=$(du -ch "$BACKUP_DIR"/*.tar.gz | tail -n 1 |awk '{print $1}')

  echo "Łączny rozmiar backupów to: ${total_backup_size}"

}

while true; do
  print_menu

  read -r user_input

  case "$user_input" in
    0)
    echo "Zamykam program..."
    break
    ;;
    1)
    create_backup
    ;;
    2)
    backup_list
    ;;
    3)
    remove_backup
    ;;
    4)
    show_backup_size
    ;;
    *)
    echo "Wybierz jedną z dostępnych opcji"
    ;;
  esac

done

exit 0
