#!/usr/bin/env bash

################################
#
# install-configs performs pre-launch configuration of the app
#
# Property of StepsAway
#
# Version 0.4
#
################################

# Check if configs script should be Run
if [ -z $INSTALL_CONFIGS ]; then
  echo "install-configs being ignored"
else

  # Assumes the configs are properly mounted at /tmp/config
  max_attempts=5
  timeout=1
  attempt=0

  while [[ $attempt < $max_attempts ]]; do

    if [ -f /tmp/config/.remote-configs ]; then
      >&2 printf "Configs found!\n"
      cp -r /tmp/config/. /home/app/
      break
    fi

    >&2 printf "Configs not found, trying again in $timeout\n"
    sleep $timeout
    attempt=$(( attempt + 1 ))
    timeout=$(( timeout * 2 ))
  done

  if [ ! -f /tmp/config/.remote-configs ]; then
    >&2 printf "Unable to find container configs...Killing container!\n"
    kill 1
  fi

  # Run mounted install-configs script if present
  if [ -f /tmp/config/install-configs.sh ]; then
    /tmp/config/install-configs.sh
  fi
fi
