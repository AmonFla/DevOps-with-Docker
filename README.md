# DevOps-with-Docker
Exercises from Devos with Docker course https://devopswithdocker.com

## Links

* [Devops is nor a role](http://turnoff.us/geek/devops-explained/)
* [Understanding How the Docker Daemon and Docker CLI Work Togethe](https://nickjanetakis.com/blog/understanding-how-the-docker-daemon-and-docker-cli-work-together)
* [What's in a Docker image?](https://cameronlonsdale.com/2018/11/26/whats-in-a-docker-image/)
* [From:latest, an opinionated Dockerfile linter](https://www.fromlatest.io/#/)
* [Use the Docker command line](https://docs.docker.com/engine/reference/commandline/cli/) 

## Most used commands
|command|explain|shorthand|
|--|--|--|
|`docker image ls`|Lists all images|docker images|
|`docker image rm <image>`|Removes an image|docker rmi|
|`docker image pull <image>`|Pulls image from a docker registry|docker pull|
|`docker container ls -a`|Lists all containers|docker ps -a|
|`docker container run <image>`|Runs a container from an image|docker run|
|`docker container rm <container>`|Removes a container|docker rm|
|`docker container stop <container>`|Stops a container|docker stop|
|`docker container exec <container>`|Executes a command inside the container|docker exec| 


### Docker options and flags
Full list at https://docs.docker.com/engine/reference/run/

- `attach`                                  : Attach local standard input, output, and error streams to a running container
    - `--no-stdin`                          : Do not attach STDIN, so ctl+c don't stop the execution
    - `<container>`                         : Name of the container
- `commit`                                  : Create a new image from a container’s changes
    - `<container>`                         : Name of the container
	- `<image>`                             : Name of the image
- `cp`                                      : Copy files/folders between a container and the local filesystem local->container:path or container:path->local
    - `<source>`                            : From where to copy 
    - `<destination>`                       : Where to copy
- `diff`                                    : Inspect changes to files or directories on a container’s filesystem
    - `<container>`                         : Name of the container. Type of changes [A = added, C = changed, D = deleted]
- `exec`                                    : Run a command in a running container
    - `-d`                                  : Detached mode: run command in the background
    - `-i`                                  : Keep STDIN open even if not attached
    - `-t`                                  : Allocate a pseudo-TTY
    - `<container>`                         : Name of the container
    - `<comando>`                           : Command to execute
        - `bash`                            
- `kill`                                    : Kill one or more running containers
    - `<container>`                         : Name of the container
- `logs`                                    : Fetch the logs of a container
    - `-f`                                  : Follow log output
    - `<container>`                         : Name of the container
- `ps`                                      : List containers
    - `-a`                                  : Show all containers (default shows just running)
- `push`                                    : Push an image or a repository to a registry
    - `<image>`                             : Name of the image
- `rm`                                      : Remove one or more containers
    - `<container>`                         : Name of the container
- `rmi`                                     : Remove one or more images
    - `<image>`                             : Name of the image
- `run`                                     : Run container in background and print container ID
    - `-d`                                  : Keep STDIN open even if not attached
    - `-i`                                  : pasa el STDIN al container. Usando -it permite arrancar y acceder al contenedor con bash
    - `--name <name>`                       : Assign a name to the container
    - `-rm`                                 : Automatically remove the container when it exits
    - `-p <host>:<container>/<protocol>`    : Publish a container's port(s) to the host, examples "-p 127.0.0.1:3456:3000", "-p 0.0.0.0:3456:3000 == -p 3456:3000", "-p 3456:3000/udp"
    - `-t`                                  : Allocate a pseudo-TTY
	- `<image>`                             : Name of the image
    - `<command>`                           : Command to execute
- `search`                                  : Search the Docker Hub for images
    - `<term>`                              : Pattern to search
- `start`                                   : Start one or more stopped containers
    - `<container>`                         : Name of the container
- `tag`                                     : Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
    - `<source>`                            : Actual name
    - `<target>`                            : New name, for example docker tag ubuntu:18.04 ubuntu:bionic o docker tag ubuntu:18.04 fav_distro:bionic 

## Dockerfile
More information at https://docs.docker.com/engine/reference/builder/

- FROM `<image>:<tag>`          : Set the base image to use 
- WORKDIR  `<path>`             : Set the working directory
- COPY `<src>` `<dest>`         : Copy file from `<src>` to `<dest>`
- ENV  `<key>=<value>`          : Sets the environment variable `<key>` to the value `<value>`
- RUN  `<command>`              : Execute any commands in a new layer on top of the current image
- EXPOSE `<port>`               : The container listens on the specified network ports at runtime
- CMD  `<command>`              : Default command to execute, if you add one command at docker run, this one will be replaced
- ENTRYPOINT `<command>`        : Allows you to configure a container that will run as an executable, so you can send parameter at docker exec

## docker-compose cli
More information at https://docs.docker.com/compose/reference/

- build                         : Build or rebuild services
- down                          : Stop and remove containers, networks, images, and volumes
- pull                          : Pull service images
- push                          : Push service images
- run                           : Run a one-off command
- up                            : Create and start containers
    - `--scale <name>=<n>`      : Makes `<n>` instance of `<name>`service

## docker-compose file
More information at https://docs.docker.com/compose/compose-file/

- version                       : docker compose version to use
- service                       : list of services to create
    - `<name>`                  : name of the service
- volumes                       : name for local volumes to use between services
- networks                      : name for networks created inside docker

### Service options

- image                         : Specify the image to start the container from
- build                         : Can be specified the build context as string with the path or an object
    - string                    : Path to Dockerfile
    - object
        - context               : Path to Dockerfile
        - dockerfile            : Name of the Dockerfile to use
        - args                  : List of arguments
- volumes                       : Mount host paths or named volumes
    - short-syntaxis            : ` - location-in-host:location-in-container`, ` - local-name:location-in-container` [more-info](https://docs.docker.com/compose/compose-file/compose-file-v3/#short-syntax-3)
    - long-syntaxis             : [more-info](https://docs.docker.com/compose/compose-file/compose-file-v3/#long-syntax-3)
        - `- type`              : the mount type volume, bind, tmpfs or npipe
        - `source`              : the source of the mount, a path on the host for a bind mount, or the name of a volume
        - `target`              : the path in the container where the volume is mounted
- container_name                : Specify a custom container name, rather than a generated default name.
- environment                   : Add environment variables. Value=key
- command                       : Override the default command
- restart                       : Restart policy, options: "no", always, on-failure, unless-stopped
- networks                      : Network to join, defined in the same docker-compose file or not
  