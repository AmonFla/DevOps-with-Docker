
Command Argument

`<git_repo>` => Git repo url
`<image_name>` => Image name
`<user>` => Docker Hub username
`<password>` => Docker Hub password

Command Sequence

`docker build . -t docker_builder`

`docker run -v /var/run/docker.sock:/var/run/docker.sock docker_builder <git_repo> <image_name> <user> <password>`
