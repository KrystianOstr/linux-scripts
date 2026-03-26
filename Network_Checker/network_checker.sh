#!/bin/bash

validate_user_input() {
  local input=$1

  if [[ -z "$input" ]]; then
      echo "Nie podano żadnych danych"
      return 1
  fi

  return 0
}

print_menu() {
  echo "=============================="
  echo "            MENU"
  echo "=============================="
  echo "1. Pokaż adresy IP i interfejsy"
  echo "2. Sprawdź połączenie z internetem"
  echo "3. Sprawdź połączenie z wybranym hostem"
  echo "4. Pokaż nasłuchujące porty"
  echo "0. Wyjście"
  echo "=============================="
}

show_ip_info() {
  echo "Pokazuję interfejsy i adresy IP:"
  echo "=============================="

  ip a
}

check_internet_connection() {
  echo "Pinguje 8.8.8.8"
  echo "=============================="

  if ping -c 3 -w 5 8.8.8.8; then
    echo "Połączenie z internetem jest aktywne"
  else
    echo "Brak połączenia z internetem"
  fi
}

check_host_connection() {
  echo "Z jakim hostem chcesz sprawdzić łączność?"

  read -r host

  validate_user_input "$host" || return 1

  if ping -c 3 -w 5 "$host"; then
      echo "Połączenie z $host jest aktywne"
  else
    echo "Brak połączenia z $host"
  fi
}

show_listening_ports() {
  echo "Sprawdzam nasłuchujące porty..."
  echo "=============================="

  full_data=$(ss -tuln | awk 'NR > 1 {print $1, "- " $5}' )

  echo "${full_data}"
}


while true; do
  print_menu

  read -r user_choice

  case "$user_choice" in
    1)
      show_ip_info    
      ;;
    2)
      check_internet_connection
      ;;
    3)
      check_host_connection
      ;;
    4)
      show_listening_ports
      ;;
    0)
      echo "Zamykanie..."
      break
      ;;
    *)
      echo "Podaj jedną z poprawnych opcji."
      ;;
  esac

done

exit 0