# Round-robin Rondo

## Story

You're team is ready for the next big step: to setup an infrastructure with a database, multiple webservers _aaaaand_ _ a load-balancer in front of them! _Booyaa!_

Unfortunately you're out of public IPs for this setup :(

But! Your mentors came to the rescue and gave your team access to a remote box to setup SSH remote port forwards!
This way you'll have multiple public ports, not IPs, but now there's at least some light at the end of the tunnel$! _(SSH or otherwise.)_

![Round-robin Rondo network map](media/admin/round-robin-rondo.png)

## What are you going to learn?

- What load balancing is and see it in action
- Configuring load balancing with in Nginx (`upstream` and `server`)
- Create a multi-tier application (DB, webservers and load-balancer)
- Use Docker and `docker-compose` in action

## Tasks

1. Your mentors will give your team an IP address and an SSH private key (`id_rsa`) so that you
could start setting up reverse SSH tunnels required in this project.
You can start working on the project before this if you're in possession of a few public IPv4 addresses.
    - Mentors gave the team an IP address (and/or domain name) for a remote environment
    - Mentors gave the team an `id_rsa` private SSH key
    - Each team member saved `id_rsa` into the project's root directory (where the `.gitignore` file is, **don't commit this key into the repository**)
    - The output of running `ssh -i id_rsa codecool@<REMOTE_IP>` contains `Only SSH remote port forwarding is allowed!`
    - 5 remote ports are used to setup tunnels by the team, depending on the number of teams the following ranges are used:

```text
Team 1 11000-11999
Team 2 12000-12999
Team 3 13000-13999
Team 4 14000-14999
Team 5 15000-15999
Team 6 16000-16999
Team 7 17000-17999
Team 8 18000-18999
Team 9 19000-19999
```

2. Define and run services using `docker-compose`. Create a database server (`db`), 3 webservers (`web1`, `web2` and `web3`) and a load balancer (`lb`). Make all services publicly available using SSH remote port forwarding.
    - Edited the `Dockerfile` in order to bundle and deploy `web.war` into the image used by the `web1`, `web2` and `web3` services
    - Configured the `web1`, `web2` and `web3` services to connect to the publicly available address of `db` by setting the following environment variables:

```sh
SPRING_DATASOURCE_URL=jdbc:postgresql://<REMOTE_IP>:<DB_PORT>/chinook
SPRING_DATASOURCE_USERNAME=<USER>
SPRING_DATASOURCE_PASSWORD=<PASS>
```
    - Configured the `db` service to automatically populate a database using the `chinook_data.sql` script
    - Configured `lb` to act as a round-robin load balancer in front of `web1`, `web2` and `web3` (using their externally accessible addresses)
    - Services are accessible locally via `http://localhost:<LOCAL_SERVICE_PORT>`
    - Services are accessible externally via `http://<REMOTE_IP>:<REMOTE_SERVICE_PORT>`
    - Executing `tunnel.sh` creates SSH tunnels and remote forwards the related service's port

## General requirements

None

## Hints

- It doesn't matter which team member runs the `db` and `lb` services
- Watch out! Forwarding to and already used remote port is not allowed, in such cases you're going to see a warning message like this (with a different port)

  ```text
  Warning: remote port forwarding failed for listen port 10010
  ```

- Use `ssh` to create tunnels like this

  ```sh
  ssh -TNi ../id_rsa -R <REMOTE_PORT>:localhost:<LOCAL_PORT> codecool@<REMOTE_IP>
  ```

  if you'd like to see extra output, you can pass a `-v` too to `ssh`

  ```sh
  ssh -vTNi ../id_rsa -R <REMOTE_PORT>:localhost:<LOCAL_PORT> codecool@<REMOTE_IP>
  ```

- Use  `autossh` instead of `ssh` to get a more reliable connection, install it with `apt-get install -y autossh`, then you can simply replace `ssh` with `autossh` when creating tunnels
- You can only use the credentials given to you to setup SSH remote port forwards, nothing else :) You can try, but it'll be in vain
- As an extra configure `lb` to use an alternative load balancing strategy (e.g. IP hash) and passive healthchecks (using `max_fails` and `fail_timeout`)

## Background materials

- [Introduction to Load Balancing with Nginx](project/curriculum/materials/tutorials/introduction-to-load-balancing-with-nginx.md)
