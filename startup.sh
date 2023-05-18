#!/bin/bash

echo "Checking Dependencies........"
if ! dpkg -l | grep -q "git"; then
  echo "Git is Missing, Installing Git...."
  # Install git
  sudo apt-get install git -y

fi
if ! dpkg -l | grep -q "nodejs"; then
  echo "nodejs is Missing, Installing nodejs...."
  curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt-get install nodejs -y

fi
touch config.json
node ./index.js
