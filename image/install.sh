#!/bin/bash
set -e
source /bd_build/buildconfig
set -x

/bd_build/prepare.sh
/bd_build/system_services.sh
/bd_build/utilities.sh
/bd_build/cleanup.sh
