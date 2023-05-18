#!/bin/bash

for arg in "$@"; do
  echo $(git -C "$arg" shortlog -sn)
done