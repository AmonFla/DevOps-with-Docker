# DevOps-with-Docket
Exercises from Devos with Docket course https://devopswithdocker.com

## Links

* (Devops is nor a role)[http://turnoff.us/geek/devops-explained/]
* (Understanding How the Docker Daemon and Docker CLI Work Togethe)[https://nickjanetakis.com/blog/understanding-how-the-docker-daemon-and-docker-cli-work-together]
* (What's in a Docker image?)[https://cameronlonsdale.com/2018/11/26/whats-in-a-docker-image/]
* (From:latest, an opinionated Dockerfile linter)[https://www.fromlatest.io/#/]
* (Use the Docker command line)[https://docs.docker.com/engine/reference/commandline/cli/]
* ()[]
* ()[]

## Most used commands
|command|explain|shorthand|
|--|--|--|
|docker image ls|Lists all images|docker images|
|`docker image rm <image>`|Removes an image|docker rmi|
|`docker image pull <image>`|Pulls image from a docker registry|docker pull|
|`docker container ls -a`|Lists all containers|docker ps -a|
|`docker container run <image>`|Runs a container from an image|docker run|
|`docker container rm <container>`|Removes a container|docker rm|
|`docker container stop <container>`|Stops a container|docker stop|
|`docker container exec <container>`|Executes a command inside the container|docker exec| 


## Commands and flags

- `attach`              
    - `--no-stdin`      : no une el stdin por lo tanto al hacer al ctrl+c no se para el contenedor
    - `<contenedor>`    : nombre del contenedor al que nos unimos y vemos el log, si le damos ctrl+c se para el contenedor
- `exec`
    - `-i`              : pasa el STDIN al container. Usando -it permite arrancar y acceder al contenedor con bash
    - `-t`              : crea una tty
    - `<contenedor>`    : nombre del contenedor
    - `<comando>`       : permite pasarle un comando al contenedor
        - `bash`        : para entrar a la consola
- `kill`
    - `<contenedor>`    : nombre del contenedor
- `logs`
    - `-f`              : permite que el log quede activo y seguirlo
    - `<contenedor>`    : nombre del contenedor
- `rm`
    - `<contenedor>`    : nombre del contenedor
- `run`
    - `-d`              : ejecuta el contenedor en 2do plano
    - `-i`              : pasa el STDIN al container. Usando -it permite arrancar y acceder al contenedor con bash
    - `--name <name>`   : permite dar un nombre al contenedor
    - `-t`              : crea una tty
    - `-rm`             : se borra automáticamente al cerrarlo
	- `<image>`         : nombre de la imagen a iniciar
    - `<comando>`       : permite pasarle un comando al contenedor
- `start`
    - `<contenedor>`    : nombre del contenedor
