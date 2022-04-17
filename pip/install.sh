#! /bin/bash

SCRIPT_DIR=`dirname "$(readlink -f "$0")"`

cp ${SCRIPT_DIR}/pip.conf ~/.conf/pip/pip.conf

