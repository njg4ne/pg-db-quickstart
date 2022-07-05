#!/bin/bash
NUM_ARGS=$#;
FILE="sneaky-badger.sql"


if [[ $1 == "lunix" ]]; then
  CMD="psql -h localhost -f $FILE ${@:2}"
  echo
  echo "Running: $CMD"
  echo
  $CMD
elif [[ $1 == "docker" ]]; then
  CMD="psql -h db -f $FILE ${@:2}"
  echo
  echo "Running: $CMD"
  echo
  $CMD
else
  echo "Usage:"
  echo "bash main.sh lunix"
  echo "OR"
  echo "bash main.sh docker"
fi
