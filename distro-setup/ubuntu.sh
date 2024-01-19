#!/bin/env bash

# Ubuntu setup for new systems

press_enter() {
  read -r -p "Press enter to continue"
}

echo "Pull latest development"
echo "> git checkout development; git pull"
press_enter
