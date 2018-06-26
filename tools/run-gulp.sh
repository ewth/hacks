#!/bin/bash

PREVDIR=`pwd`
cd ~/www/speqs/tools
gulp styles > /dev/null 2>&1
cd ${PREVDIR}
echo "Done"
