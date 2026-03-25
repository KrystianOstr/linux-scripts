# Nginx Deployment Script (Bash)

## Description

Simple Bash script for deploying a static HTML file to an Nginx web server.

The script checks whether the deployment file exists, stops the Nginx service, copies the file to the default web directory, starts Nginx again, and verifies the deployment with a local HTTP check.
Useful for practicing Bash automation, service management, and basic deployment workflow on Linux.

---

## Features

* Validate deployment file before starting
* Stop the Nginx service before deployment
* Copy a selected HTML file to the default Nginx web root
* Start Nginx after file replacement
* Test deployment using `curl`
* Install Nginx if it is not available
* Display clear status messages during each step

---

## How to run

```bash
chmod +x nginx_deploy.sh
./nginx_deploy.sh /path/to/index.html
```

---

## Example usage

```bash
./nginx_deploy.sh ./index.html
```

Example flow:

```text
- validate deployment file
- stop nginx
- copy file to /var/www/html/index.html
- start nginx
- test deployment locally
```

---

## What I learned

* Validating input arguments in Bash
* Checking file existence before deployment
* Managing services with `systemctl`
* Copying deployment files with `cp`
* Testing web application response with `curl`
* Building step-by-step deployment logic in Bash
* Handling errors and exiting safely when a step fails
