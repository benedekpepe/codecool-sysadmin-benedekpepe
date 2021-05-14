# All Your Logs Are Belong to Us!

## Story

You are the administratior of an [Apache webserver](https://httpd.apache.org/) and your boss tasked you to analyze the hell out of its `access.log` in which you can see the kinds of things, files, images, etc. that were requested from your webserver by clients (typically people browsing the Internet via a browser).
As an aspiring system administrator you said *challenge accepted* and made your goal to handle these log files like a pro!
Let's get to it!

## What are you going to learn?

- Reading and filtering log files with `grep`, `cut`
- Using multiple simple commands after each other with pipes e.g `grep ... | cut ...`
- Using simple regular expressions (regex)
- Creating file from command outputs
- Using `sort` and `uniq` to transform a command's output

## Tasks

1. Write a script which removes the IP addresses and browser information from the log file.
    - 1st column in result is the *time when the request was recieved*
    - 2nd column in result is the *request's type*
    - 3rd third column in result is the *requested resource*
    - 4th column in result is the *status code of the response*

2. Write a script that filters and lists server errors (`5**` status codes) from the log file.
    - The content of `result2.txt` is

```
66.249.73.135 [18/May/2015:03:05:34 +0000] "GET /misc/Title.php.txt HTTP/1.1" 500 -
66.249.73.135 [18/May/2015:15:05:42 +0000] "GET /misc/Title.php.txt HTTP/1.1" 500 -
64.131.102.243 [20/May/2015:14:05:16 +0000] "OPTIONS /projects/xdotool/ HTTP/1.1" 500 626
```
    - The `result2.txt` contains 3 rows

3. Write a script that counts how many times a resource was requested.
    - The format of `result3.txt` should look like this

```
    546 /style2.css
      1 /svnweb/xpathtool/
      9 /test.xml
```
    - Each element in the output's resource column is unique, there are no duplications
    - The `result3.txt` contains 1498 rows

4. Write a script to search for requests that were made by a browser with the `Mozilla/4.0` identifier then list the associated IP addresses in descending order.
    - `result4.txt` should contain a single column with IP addresses

```
195.248.32.227
195.242.218.133
194.103.63.154
```
    - Each IP in the output is unique, there are no duplications
    - The IP addresses are in descending order
    - The `result4.txt` contains 95 rows

5. Write a script to filter successful requests for images and output the images' path and the responses' status codes.
    - The format of `result5.txt` should look like this

```
/images/elasticsearch-logstash-piesnacking.png 200
/images/jordan-80.png 206
/presentations/logstash-monitorama-2013/images/logstashbook.png 200
/projects/newpsm/images/newmouse.png 200
```
    - The output only contains request paths that ends with `.png` or `.jpg`
    - The output only contains `GET` requests
    - The output only contains requests where the response status code was in the `2**` range

## General requirements

- Each task is saved in a file `task<number-of-task>.sh`, e.g. `task1.sh`, `task2.sh`, etc.
- Running a task's script should reference the `access.log` and produce a result `.txt` without requiring user interaction
- Running a task's script produces a result `.txt` file, e.g. running `task3.sh` produces `result3.txt` in the same directoy where the shell script is

## Hints

- Be careful when filtering for status codes (like `5[0-9][0-9]`) since the size column in the log might contain such numbers
- `access.log` is a log file produced by an Apache webserver
  - [Read about the log format](https://www.sumologic.com/blog/apache-access-log/), focus on the section *Reading Apache Access Logs* only and the next two sub-sections *Common Log Format* and *Combined Log Format*, the rest isn't relevant now
  - [Here you can read the log format's official docs]((https://httpd.apache.org/docs/2.4/logs.html#accesslog)), focus on part with this example and what's just below that

    ```text
    127.0.0.1 - frank [10/Oct/2000:13:55:36 -0700] "GET /apache_pb.gif HTTP/1.0" 200 2326
    ```

- The delimiters in the log file are whitespaces (` `)
- Be careful when using `cut`, try it, and examine the structure of the log file for a better understanding
- You can only use `uniq` on an already sorted input

## Starting your project



## Background materials

- <i class="far fa-exclamation"></i> [Introduction to Regular Expressions (Regex)](project/curriculum/materials/tutorials/introduction-to-regex.md)
- <i class="far fa-exclamation"></i> `grep` [command in Linux](https://www.geeksforgeeks.org/grep-command-in-unixlinux/)
- <i class="far fa-exclamation"></i> `cut` [command in Linux](https://www.geeksforgeeks.org/cut-command-linux-examples/)
- <i class="far fa-book-open"></i> `sort` [command in Linux](https://www.geeksforgeeks.org/sort-command-linuxunix-examples/)
- <i class="far fa-book-open"></i> `uniq` [command in Linux](https://www.geeksforgeeks.org/uniq-command-in-linux-with-examples/)
- <i class="far fa-book-open"></i> Filters in Linux, [geeksForGeeks](https://www.geeksforgeeks.org/filters-in-linux/)
- <i class="far fa-book-open"></i> [12 useful commands for filtering text files](https://www.tecmint.com/linux-file-operations-commands/)
