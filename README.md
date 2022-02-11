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


## Commands and flags

- `attach`              
    - `--no-stdin`                          : no une el stdin por lo tanto al hacer al ctrl+c no se para el contenedor
    - `<contenedor>`                        : nombre del contenedor al que nos unimos y vemos el log, si le damos ctrl+c se para el contenedor
- `commit`
    - `<contenedor>`                        : nombre del contenedor a guardar en una nueva imagen
	- `<image>`                             : nombre de la imagen a generar
- `cp`
    - `<origen>`                            : que quiero copiar dentro del docker
    - `<contenedor>:<path>`                 : nombre de la imagen y ruta donde copiar
- `diff`
    - `<contenedor>`                        : nombre del contenedor para ver que cambio dentro [A = added, C = changed, D = deleted]
- `exec`
    - `-i`                                  : pasa el STDIN al container. Usando -it permite arrancar y acceder al contenedor con bash
    - `-t`                                  : crea una tty
    - `<contenedor>`                        : nombre del contenedor
    - `<comando>`                           : permite pasar un comando al contenedor
        - `bash`                            : para entrar a la consola
- `kill`
    - `<contenedor>`                        : nombre del contenedor
- `logs`    
    - `-f`                                  : permite que el log quede activo y seguirlo
    - `<contenedor>`                        : nombre del contenedor
- `push`
    - `<image>`                             : imagen a publicar, antes hacer login
- `rm`
    - `<contenedor>`                        : nombre del contenedor
- `run`
    - `-d`                                  : ejecuta el contenedor en 2do plano
    - `-i`                                  : pasa el STDIN al container. Usando -it permite arrancar y acceder al contenedor con bash
    - `--name <name>`                       : permite dar un nombre al contenedor
    - `-t`                                  : crea una tty
    - `-rm`                                 : se borra automáticamente al cerrarlo
    - `-p <host>:<container>/<protocol>`    : mapea un puerto por ejemplo "-p 127.0.0.1:3456:3000", "-p 0.0.0.0:3456:3000 == -p 3456:3000", "-p 3456:3000/udp"
	- `<image>`                             : nombre de la imagen a iniciar
    - `<comando>`                           : permite pasar un comando al contenedor
- `search`
    - `<image>`                             : nombre de la imagen 
- `start`
    - `<contenedor>`                        : nombre del contenedor
- `tag`
    - `<imagen>`                            : imagen a ser etiquetada
    - `<nuevo>`                             : nuevo nombre o etiqueta por ejemplo docker tag ubuntu:18.04 ubuntu:bionic o docker tag ubuntu:18.04 fav_distro:bionic 

### Dockerfile

- FROM `<image>:<tag>`          : imagen a utilizar
- WORKDIR  `<path>`             : directorio de trabajo
- COPY `<origen>` `<destino>`   : que copiar dentro del docker
- ENV  `<variables>`            : defino variables de entorno
- RUN  `<command>`              : comando a ejecutar mientras se arma la imagen
- EXPOSE `<port>`               : expone un puerto del contenedor
- CMD  `<command>`              : que ejecutar dentro del docker al iniciar, se pisa con lo especificado en la opción `<comando>` al hacer docker run o exec
- ENTRYPOINT `<command>`        : inicio del comando al cual se le agrega lo especificado en la opción `<comando>` al hacer docker run o exec
