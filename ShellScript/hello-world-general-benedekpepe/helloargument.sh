#!/bin/bash
get_hello_message() {
  name=$1
  if [ -z "$name" ]
  then
    echo "Hello, World!"
  else
    echo "Hello, $name!"
  fi
}

get_user_name() {
  read -p "What's your name? " entered_name
  echo ${entered_name^}
}

say_hello() {
  name=$(get_user_name)
  get_hello_message $name
}

say_hello