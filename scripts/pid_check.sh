#!/bin/bash
#
# usage: pid_check.sh [pid] [predecessor-pid] [...]

if [  "$#" -le 1 ]
then
  echo "usage: $0 [pid] [predecessor-pid] [...]"
  exit 2
fi

process_pid=$1

if [ "$process_pid" -eq 0 ]
then
  exit 3
fi

shift 1 

while true
do
  # echo "Checking for parent of $process_pid..."
  ppid=`cat /proc/$process_pid/stat | cut -d' ' -f4`
  # echo "Parent pid is: $ppid..."

  for parent_pid in $@
  do
    # echo "Comparing with pid: $parent_pid..."
    if [ "$ppid" -eq "$parent_pid" ]
    then
      # echo "Compare result: OK"
      exit 0
    elif [ "$ppid" -eq "1" ]
    then
      # echo "We are at the top - finishing..."
      exit 1
    fi
  done

  process_pid=$ppid
  # read
done
