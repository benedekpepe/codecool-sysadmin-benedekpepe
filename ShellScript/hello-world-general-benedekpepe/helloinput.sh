#!/bin/bash
get_hello_message() {
  read -p "What's your name? "  name
  if [ -z "$name" ]
  then
    echo "Hello, World!"
  else
    echo "Hello, $name!"
  fi
}
get_hello_message