#!/bin/bash
echo "Cleaning Up....."
if test -f "./output.json"; then
  rm "./output.json"
  echo "Output file removed."
fi
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
echo "Everything seems cool........"

output=$(node ./index.js getPathString)

source ./repo-stat.sh $output

node ./index.js parseOutFileData
#clean up
rm output.json