# Hello World

## Story

No question that your first programming exercise must be a [Hello, World!](https://en.wikipedia.org/wiki/%22Hello,_World!%22_program) implementation. However, we wouldn't want to bore you - let's be bold and and make your "Hello, World!" shine!

!> This is a **guided project**, a regular project with a step-by-step guide
   (see the Background materials). In order to learn the most, try and
   implement it on your own first, and check the solution only when you feel
   your version is ready. However, when you feel completely stuck, feel free
   to check the guide for hints.

## What are you going to learn?

- write strings to the console (a.k.a. _printing_)
- define and call functions
- use return values
- get user input
- call functions with arguments
- separation of concerns

## Tasks

1. Modify `helloworld.sh` so that it prints out `Hello, World` to the console (do not write any functions yet)
    - Running `helloworld.sh` prints out `Hello, World!` to the console
    - The source code of `helloworld.sh` contains no function definitions

2. Create and call a function in `hellofunction.sh` which prints `Hello, World!` to the console
    - Running `hellofunction.sh` prints out `Hello, World!` to the console
    - The source code of `hellofunction.sh` defines and calls a `say_hello()` function which is responsible for printing the `Hello, World!` message

3. Create and call two functions in `helloreturn.sh` - one should return the `Hello, World!` string to the another which prints this message to the console
    - Running `helloreturn.sh` prints out `Hello, World!` to the console
    - The source code of `helloreturn.sh` defines a `get_hello_message()` function which does not print anything but `echo` the `Hello, World!` message
    - The source code of `helloreturn.sh` defines and calls a `say_hello()` function which is responsible for printing the message returned by `get_hello_message()`

4. Create and call two functions in `helloinput.sh` - one should ask for the name of the user and an another which prints the custom greeting message to the console
    - Running `helloinput.sh` prints `What's your name?`, asks for user input, and using the input prints `Hello, <name>!` to the console
    - Running `helloinput.sh` asks `What's your name?`, and if the user does not enter anything, it prints `Hello, World!` to the console
    - The source code of `helloinput.sh` defines a `get_hello_message()` function which prints `What's your name?`, and returns `Hello, <name>!` using the user input (or `Hello, World!` for an empty input)
    - The source code of `helloinput.sh` defines and calls a `say_hello()` function which is responsible for printing the message returned by `get_hello_message()`

5. Capitalize the user's diplayed name in a reorganized `helloargument.sh` that separates the input collection and the message assembly parts
    - Running `helloargument.sh` prints `What's your name?`, asks for user input, and using the input prints `Hello, <Name>!` to the console (`<Name>` is capitalized)
    - Running `helloargument.sh` asks `What's your name?`, and if the user does not enter anything, it prints `Hello, World!` to the console
    - The source code of `helloargument.sh` defines a `get_user_name()` function which prints `What's your name?`, and returns the capitalized version of the user's input string
    - The source code of `helloargument.sh` defines a `get_hello_message()` function which returns `Hello, <name>!` using the incoming argument (or `Hello, World!` for an empty argument)
    - The source code of `helloargument.sh` defines and calls a `say_hello()` function which is responsible for printing the message after collecting the returned values from the other two functions

## General requirements

None

## Hints

None

## Starting your project



## Background materials

- <i class="far fa-exclamation"></i> [A step-by-step solution guide](project/curriculum/materials/pages/unix/hello-world-step-by-step-shell.md)
- <i class="far fa-exclamation"></i> [Variables](https://www.shellscript.sh/variables1.html)
- <i class="far fa-exclamation"></i> [Functions](https://www.shellscript.sh/functions.html)
- <i class="far fa-exclamation"></i> [Variables part2](https://www.shellscript.sh/variables3.html)
- <i class="far fa-book-open"></i> [Quick reference](https://www.shellscript.sh/quickref.html)

