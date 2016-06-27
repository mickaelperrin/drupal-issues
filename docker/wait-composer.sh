#!/bin/bash

echo "Waiting for composer to finish"
until ps -aef | grep [c]omposer; do
  printf "."
  sleep 0.1
done

echo -e "\nComposer has finished"
