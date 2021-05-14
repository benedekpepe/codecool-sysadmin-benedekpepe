# (Tom)cat in a Box

## Story

You know, that you can run containers in Docker if you have the image to do so. Now, you'd like to try if you can build that image yourself. You've set sail and set your goal: create a Docker image for a simple webapp using Tomcat. If you succeed (_bah_ **WHEN** you succeed) your mates will be able to pull and run the same image with _noooo_ trouble at all.

## What are you going to learn?

- How to build a Docker image
- How to write a `Dockerfile` yourself
- How to publish an image to Docker Hub to share it with others

## Tasks

1. Write the `Dockerfile` that's going to be used to build your shiny new image.
    - `Dockerfile` exist
    - The new image is based on [the official `tomcat`](https://hub.docker.com/_/tomcat) Docker image
    - The new image is based on the following tagged version of the official `tomcat`: `9.0.41-jdk11`
    - `todo-mvc.war` is copied into the new image
    - The sample `.war` is deployed as the `ROOT` webapp to Tomcat

2. While writing your `Dockerfile` try out things frequently and build your image multiple times.
    - `docker build` is used to build the image based on the `Dockerfile`
    - The image is named as `tomcat-in-a-box`

3. Similarly to the proof of the pudding being eating it, the real test of a Docker image is running it!
    - Started a container based on the `tomcat-in-a-box` image
    - The container's port 8080 is mapped to the Docker host on port 80
    - Visiting `http://localhost` loads the webapp (beware of port forwarind when the Docker host is inside a VM)

4. After you're done with polishing your Docker image push it to Docker Hub to share it easily with the world!
    - The published image is accessible by _anyone_ in the world by `docker pull <dockerhub-username>/tomcat-in-a-box`

## General requirements

None

## Hints

- When using the official `tomcat` image there's no need to install Tomcat itself ... it's _in the box_ already :)
- Inside the official `tomcat` image the base folder of the Tomcat installation is at `/usr/local/tomcat` (you can also refer to this directory with `$CATALINA_BASE`)
- The `webapps/` folder in the official `tomcat` image is empty (the sample webapps, like the manager, are available at `/usr/local/tomcat/webapps.dist`)
- Tomcat needs sometime before it _really_ starts even when using containers, to see what happens inside the box use `docker logs --follow <ID>`
- If you have a container running `tomcat` (or your own image based on that) you can use the following command to browse its filesystem: `docker exec -it <ID> ls -la /usr/local/tomcat` or run whatever command you may want, like `cat` (beware that some executables, commands might now be available _inside_ the container)
- When creating a Docker Hub repository make sure that it's set to public
- As an extra challenge you can try using `Dockerfile` commands like `RUN` to deploy Tomcat's sample webapps to the container as well (from `webapps.dist`, like the manager app) and make them accessible remotely for a specific user defined in `tomcat-users.xml`

## Background materials

- [Introduction to Docker](project/curriculum/materials/tutorials/introduction-to-docker.md)
- [Introduction to `docker build`](project/curriculum/materials/tutorials/introduction-to-docker-build.md)
- [Publishing images to Docker Hub Tutorial](https://ropenscilabs.github.io/r-docker-tutorial/04-Dockerhub.html)
- [Official page about publishing to Docker Hub](https://docs.docker.com/docker-hub/repos/)
- <i class="far fa-camera"></i> [Push Docker Images to Docker Hub](https://www.youtube.com/watch?v=fdQ7MmQNTa0)
- [Tomcat `ROOT.war`](https://www.baeldung.com/tomcat-root-application#deploying-the-app-as-rootwar)
