# Local Load Balancing

## Story

You are hosting a popular website and due to the ever increasing number of visitors your server is slowing down. You've been told by your _beauuuuuuuutiful_ mentors that a good solution would be to deploy multiple servers and to distrubute the load between them evenly using a load balancer.

## What are you going to learn?

- What load balancing is and see it in action
- Configuring load balancing with in Nginx (`upstream` and `server`s)
- What does the 502 HTTP response status code mean
- See Nginx's passive health checks in action


## Tasks

1. Define and start 3 services/containers to act as your (upstream) servers in `docker-compose.yml`.
    - 3 app containers (named `app1`, `app2` and `app3`) are defined based on [the `traefik/whoami` image](https://hub.docker.com/r/traefik/whoami)
    - Exposed port 80 of `app1`, `app2` and `app3` to 5001, 5002 and 5003 respectively
    - Set the `WHOAMI_NAME` environment variable to `app1`, `app2` or `app3` respectively
    - `curl localhost:5001` (also with port 5002 and 5003) works, the output contains `Name: app1` (`app2` or `app3` depending on the used port)

2. Modify `default.conf` to end up with a working Nginx load balancer configuration.
    - Configured the load balancer to listen on port 80
    - An `upstream` called `app` is defined with 3 `server` pointing to the services `app1`, `app2` and `app3`
    - Configured the load balancer to `proxy_pass` requests matching the `/` path to the `upstream`

3. Define and start a service/container to act as your load balancer in `docker-compose.yml` using `default.conf`.
    - A load balancer service (called `lb`) is defined based on [the `nginx` image](https://hub.docker.com/_/nginx)
    - Exposed port 80 of `lb` to port 80 on the Docker host
    - Bind mounted `default.conf` at `/etc/nginx/conf.d/default.conf`
    - Executing `curl localhost` multiple times outputs different `app` node names everytime (e.g. `Name: app1`, `app2` or `app3` in a round-robin fashion)

## General requirements

None

## Hints

- Test often!
- Check whether your ports are alright with `docker-compose ps`
- Use `docker-compose stop` and `start` to bring down and back online individual `app` nodes to simulate server failure behind to the load balancer
- What happens when there are no reachable upstream servers behind the load balancer at all?
- Use `curl` to get around browsers' webpage caching
- Setting `WHOAMI_NAME: appX` for a container created from the `traefik/whoami` names the node, when visiting it it'll display `Name: appX`
- Try and see whether load balancing work when the ports of `app1`, `app2` and `app3` are not exposed to your Docker host
- As an extra replace `traefik/whoami` and create images to host webapps that display in `<h1>` HTML tags `App 1`, `App 2` and `App 3` for the app nodes

## Background materials

- [Introduction to Load Balancing with Nginx](project/curriculum/materials/tutorials/introduction-to-load-balancing-with-nginx.md)
- [Load balancing with Nginx](http://nginx.org/en/docs/http/load_balancing.html)
- [Nginx as a load balancer](https://docs.nginx.com/nginx/admin-guide/load-balancer/http-load-balancer/)
- [Nginx `upstream` directive](http://nginx.org/en/docs/http/ngx_http_upstream_module.html#upstream)
- [Nginx `server` directive](http://nginx.org/en/docs/http/ngx_http_upstream_module.html#server)
- [502 HTTP status code](https://httpstatuses.com/502)
