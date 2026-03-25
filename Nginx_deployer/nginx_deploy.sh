#!/bin/bash

source_file=$1
nginx_path="/var/www/html/index.html"

check_if_file_exists() {
  echo "================================="
  if [ -z "$1" ]; then
    echo "Provide proper argument"
    exit 1
  fi

  if [ ! -f "$1" ]; then
    echo "Deployment file does not exist"
    exit 1
  fi

  echo "Deployment file exists"
  echo "================================="
}

stop_nginx() {
  echo "================================="
  echo "Stopping nginx..."
  if sudo systemctl stop nginx; then
    echo "Nginx stopped."
  else
    echo "Couldn't stop nginx. Exiting the script."
    exit 1
  fi
  echo "================================="
}

copy_file() {
  echo "================================="
    echo "Copying files..."
  if sudo cp "$1" "${nginx_path}"; then
    echo "Files copied."
  else
    echo "Couldn't copy files. Exiting the script."
    exit 1
  fi
  echo "================================="
}

start_nginx() {
  echo "================================="
  echo "Starting nginx..."
  if sudo systemctl start nginx; then
    echo "nginx started."
  else
    echo "Couldn't start nginx. Exiting the script."
    exit 1
  fi
  echo "================================="
}

deployment_test() {
  echo "================================="
  echo "Testing..."
  if curl -s localhost | grep -q "janusz"; then
    echo "Site works perfectly"
  else
    echo "We're facing some issues. Please check the deployment"
    exit 1
  fi
  echo "================================="
}

install_nginx() {
  echo "================================="
  echo "Installing..."
  if sudo apt install nginx -y; then
    echo "Installation done."
    echo "You can re-run script now."
  else
    echo "Couldn't install nginx. Exitting the script."
    echo "Contact your administrator."
    exit 1
  fi
  echo "================================="
}


#MAIN FLOW

check_if_file_exists "${source_file}"

if systemctl is-active --quiet nginx; then
  echo "Script starting..."
  echo "================================="

  stop_nginx

  copy_file "${source_file}"

  start_nginx

  deployment_test
else
  echo "Nginx is not installed in the system"

  install_nginx
fi