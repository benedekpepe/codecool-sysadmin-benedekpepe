# Widgets.sh

## Story

Your friend saw a Windows administrator using widgets like [this](https://win10widgets.com/images/screenshot.png), but he uses Linux and asked you to help him out by writing something similar for his terminal.

## What are you going to learn?

- Practice writing shell scripts
- Use environment variables in practice
- Use basic control structures
- Learn which files in Linux hide information about the system

## Tasks

1. The behaviour of `widget.sh` should be controlled with the `WIDGET_CONTROL` enviromental variable. The contents of `WIDGET_CONTROL` are separated by commas and can be one or more of the following in any order: mem, cpu, proc, user, disk.
    - If `WIDGET_CONTROL` is not set `widget.sh` displays memory and cpu stats
    - If `WIDGET_CONTROL` is set `widget.sh` displays stats about the given parameters, e.g. if `WIDGET_CONTROL=mem,user` then memory and user stats are displayed

2. Write a script (`mem.sh`) that displays information about memory usage and free memory.
    - The script displays the amount of free memory
    - The script displays the amount of total memory

3. Write a script (`cpu.sh`) that displays information about the CPU.
    - The script displays the CPU's model name
    - The script displays the number of CPU cores
    - The script displays the CPU's clock frequency (in MHz or GHz)

4. Write a script (`proc.sh`) that displays the number of running processes.
    - The script displays the number of running processes.

5. Write a script (`disk.sh`) that displays the avaible disks and the total amount of free space.
    - The script displays all available disks (block devices), e.g. `/dev/sda`, `/dev/sdb`, etc.
    - The script displays the amount of total disk space
    - The script displays the amount of free space
    - The script displays the percentage of used disk space

6. [OPTIONAL] You've found a way to extract some nifty information from a file hidden deep inside in the Linux file hierarchy. Feel free to add this new functionalty similarly to the other scripts, like `mem.sh` and its friends.
    - Be creative! :)

## General requirements

None

## Hints

- Remeber, in Linux _everything_ is a file! :)
- You can pipe the output of commands to `grep` and/or `cut`  to filter relevant information
- You can find various information about memory and cpu in `/proc/meminfo` and `/proc/cpuinfo`
- You can find the list of users in `/etc/passwd` and groups in `/etc/group`
- You can find information about disk usgint the `lsblk` command and `df` for disk usage
- Most of the command's output can be written without headers using arguments for easier parsing for scripts

## Starting your project



## Background materials

- <i class="far fa-exclamation"></i> [Shell Scripting Tutorial](https://www.shellscript.sh/)
- <i class="far fa-exclamation"></i> [Shell Variables](http://faculty.salina.k-state.edu/tim/unix_sg/shell/variables.html#:~:text=Arguments%20or%20variables%20may%20be,third%20argument%2C%20etc...)
- <i class="far fa-book-open"></i> [Shell scripting and system variables](https://www.purdue.edu/hla/sites/varalalab/wp-content/uploads/sites/20/2018/02/Lecture_5.pdf)
