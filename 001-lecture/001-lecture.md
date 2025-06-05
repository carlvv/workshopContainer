# Table of Contents
1. [Hands on docker - Part1](#handson1)
    1. [Docker basics: containerizing a simple cli tool](#handson1-basics)
    2. [Working with registries](#handson1-registries)



# Hands on docker - Part I <a name="handson1"></a>

## Docker basics: containerizing a simple cli tool<a name="handson1-basics"></a>

### The Dockerfile

```dockerfile
FROM debian:12
LABEL com.example.workshop="0.0.1-beta"

RUN apt update \
    && apt install -y curl \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["curl -s https://www.hamburg.de/"]

```

### build
```bash
$ cd lecture1/
$ docker build -t ws-soa-1:latest .

$ docker images
# REPOSITORY           TAG       IMAGE ID       CREATED        SIZE
# ws-soa-1             latest    8b34eaa04cd6   12 days ago    74.8MB

$ docker image inspect ws-soa-1
```


### run, ps, rm, logs
```bash
$ docker run --help
Usage:  docker run [OPTIONS] IMAGE [COMMAND] [ARG...]

Create and run a new container from an image

Aliases:
docker container run, docker run

Options:
-d, --detach                           Run container in background and print container ID
--entrypoint string                Overwrite the default ENTRYPOINT of the image
-e, --env list                         Set environment variables
--env-file list                    Read in a file of environment variables
--expose list                      Expose a port or a range of ports
--health-cmd string                Command to run to check health
--health-interval duration         Time between running the check (ms|s|m|h) (default 0s)
--health-retries int               Consecutive failures needed to report unhealthy
--init                             Run an init inside the container that forwards signals and reaps processes
-i, --interactive                      Keep STDIN open even if not attached
--ip string                        IPv4 address (e.g., 172.30.100.104)
--log-driver string                Logging driver for the container
--log-opt list                     Log driver options
--mount mount                      Attach a filesystem mount to the container
--name string                      Assign a name to the container
--network network                  Connect a container to a network
--rm                               Automatically remove the container and its associated anonymous volumes when it exits
-t, --tty                              Allocate a pseudo-TTY
-v, --volume list                      Bind mount a volume
-w, --workdir string                   Working directory inside the container
```

```bash
---------------------------------------------
# The run command
$ docker run --help
Usage:  docker run [OPTIONS] IMAGE [COMMAND] [ARG...]

Create and run a new container from an image
--------------------------------------------- 
# Run a container of the image

$ docker container run ws-soa-1

$ docker container ps -a

$ docker container rm <...>

$ docker run --rm ws-soa-1


$ docker run --name determined_annuth ws-soa-1
$ docker container ps -a


# custom command
$ docker run --rm ws-soa-1 "echo 'Hello Prof. Annuth!'"


# interactive mode
$ docker run --rm --interactive --tty ws-soa-1 /bin/bash
$ docker run --rm -i -t ws-soa-1 /bin/bash
$ docker run --rm -it ws-soa-1 /bin/bash
>$ env

# logs
$ docker run --name elegant_annuth ws-soa-1 'curl -s https://www.fh-wedel.de'
$ docker logs --timestamps elegant_annuth 
$ docker rm elegant_annuth

# detach
docker run --detach --name determined_annuth ws-soa-1 'curl -s https://www.fh-wedel.de'
docker logs determined_annuth
docker rm determined_annuth
docker run -d --name determined_annuth ws-soa-1 'curl -s https://www.fh-wedel.de'
```

### Exchanging data: env, mount

```bash
# passing an environment variable
$ docker run --rm --interactive --tty -e HOCHSCHULE=FHW ws-soa-1 /bin/bash
>$ env

# example with environment variables 
$ docker run --rm  -e HOCHSCHULE_WEBSITE=https://www.fh-wedel.de ws-soa-1 'curl -s $HOCHSCHULE_WEBSITE' 
$ docker run --rm  -e HOCHSCHULE_WEBSITE=https://www.fh-wedel.de ws-soa-1 "curl -s $HOCHSCHULE_WEBSITE" 
$ export HOCHSCHULE_WEBSITE=https://www.fh-wedel.de; docker run --rm  ws-soa-1 "curl -s $HOCHSCHULE_WEBSITE"
$ export HOCHSCHULE_WEBSITE=https://www.fh-wedel.de; docker run --rm  -e HOCHSCHULE_WEBSITE=$HOCHSCHULE_WEBSITE ws-soa-1 'curl -s $HOCHSCHULE_WEBSITE' 

# mount 
$ mkdir hostfs
$ touch hostfs/hi-from-host
$ docker run --rm -it --volume $(pwd)/hostfs:/tmp/host ws-soa-1 /bin/bash
$> ls -lah /tmp/host
$> cd /tmp/host && touch hi-from-container

```






---

## Working with registries<a name="handson1-registries"></a>

### Public & Private registries

- registry > repository

> "like git for docker images"

hub.docker.com

gcr.io

https://gallery.ecr.aws/

quay.io

...

```
$ docker login
```

### pull

```bash

$ docker images

# https://hub.docker.com/_/hello-world

$ docker pull hello-world

$ docker run hello-world

$ docker images hello-world
```

### build, push, tag

```
$ docker build -t fhw-test:latest -t fhw-test:001
$ docker push
```

### search

```
$ docker search nginx

$ docker search --filter is-official=true nginx 

```

 