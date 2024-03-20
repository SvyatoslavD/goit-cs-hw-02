#!/bin/bash

logfile="task1.log"
sites=("https://google.com" "https://facebook.com" "https://twitter.com")

rm $logfile

for site in "${sites[@]}"; do

  status_code=$(curl -o /dev/null -s -w "%{http_code}\n" $site)

  if [ $status_code -eq 200 ]; then
    msg="$site is UP"
  else
    msg="$site is DOWN"
  fi

  echo $msg | tee -a $logfile

done

echo "Results are saved to $logfile"
