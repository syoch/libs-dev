#!/bin/bash

for fg in `seq 0 7`; do
  for bg in `seq 0 7`; do
    printf "\x1b[3${fg};4${bg}m3${fg};4${bg}\x1b[0m "
  done
  printf "\n"
done

echo ""

for ctl in `seq 0 9`; do
  printf "\x1b[${ctl}m${ctl}\x1b[0m "
done
printf "\n"

