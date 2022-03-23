#!/bin/bash

usage() {
  cat << EOF
Pingroom
Description: Ping a room with normalized and structued names
Usage: pingroom [first desk number] [last desk number] [room prefix]

Examples:
  pingroom 650 656 ECS234

Outputs Truthy/Falsly messages to output.txt and a full ping log to pingLog.txt
EOF
    exit
}

if [ $# -eq 0 ]; then
  usage
  exit 0
fi

END=$2
> output.txt
> pingLog.txt
for ((i=$1;i<=END;i++)); do
  echo -e "Pinging $3-D$i"
  echo -e "\n=====$3-D$i=====" >> pingLog.txt
  ping $3-D$i >> pingLog.txt
  rc=$?
  if [[ $rc -eq 0 ]]; then
    echo -e "$3-D$i is Online" >> output.txt
  else
    echo -e "$3-D$i is non-pingable" >> output.txt
  fi
done
  echo "EOF" >> output.txt

