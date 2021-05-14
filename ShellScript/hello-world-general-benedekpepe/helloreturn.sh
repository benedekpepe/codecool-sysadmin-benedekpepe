#!/bin/bash
get_hello_message() {
  echo "Hello, World!"
}

say_hello() {
  message=$(get_hello_message)
  echo $message
}

say_hello