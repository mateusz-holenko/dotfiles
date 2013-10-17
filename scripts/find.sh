#!/bin/bash

if [ $# -eq 2 ]
then
  find . -iname '*'"$2"'*' -type $1
elif [ $# -eq 1 ]
then
  find . -iname '*'"$1"'*'
fi
