# Tasks 📝

## 01 cowsay

Create a new image that is based on `debian:12-slim`, the Dockerfile should be named and built from `Dockerfile-cowsay`, has the package `cowsay` installed and launches `cowsay` (with a polite greeting) when running the container. (Hint: the cowsay package will be installed to `/usr/games/cowsay`)

1. List the Dockerfile.
2. List the build command.
3. List a run command, that removes the container after finishing automatically.
4. Let cowsay echo the contents of `/etc/hosts` of the container instead of a personal greeting.
5. Mount a file from your host volume to the container. Let `cowsay` echo the contents of the file, by overwriting the command during `docker run`.
6. Let cowsay echo the output to a file. The file should be output to a volume which is mounted to the host system.
7. Develop your own build-pipeline (bash) that emits a container image with your application and pushes the latest tag to your private registry.

## 02 Host a website + port bindings

Create a `docker run` command that let's you open the website on your local machine.
The container name should be `fhw-nginx` and be removed after the container is stopped.
There are multiple files that need to be mounted to the container:
- the `./data` directory must be mounted to `/www/data` in the container
- the `./conf.d` directory must be mounted to `/etc/nginx/conf.d` in the container
- the `./nginx.conf` file must be mounted to `/etc/nginx/nginx.conf` in the container

You will need to bind a host port to a container port:

```
$ docker run --help
> -p, --publish list                     Publish a container's port(s) to the host
```
1. Read the documentation at [https://docs.docker.com/get-started/docker-concepts/running-containers/publishing-ports/](https://docs.docker.com/get-started/docker-concepts/running-containers/publishing-ports/).
2. How does the -p option work?
3. The container exposes port 80 for the website. Bind it to the host port 8080.
4. Open the website from your local browser.
5. How does the full run command look like?

## 03 Host a webserver with endpoints + docker compose

There is a simple webserver image available at `docker.io/herrsorgenfrei/boothello`. When launched, it will expose an HTTP endpoint at `:8080/api/helloworld/name`. Replace `name` with the name to greet.
1. Make the service available on your local machine.
2. Build a custom `curl` (macos/linux) or `Invoke-WebRequest` (Windows)  command to fetch the response from the webserver.
3. Use the `curl` container from the beginning to fetch the data. How does the `docker run` command look like?
4. What does the `docker run --detach` option do? Create a `docker run` command with detach. Which other docker commands are important when using `-d / --detach`?

## 04 Warm up with docker compose

Read the documentation about docker compose at https://docs.docker.com/compose/intro/compose-application-model/.

You will find an example for `docker compose` at [https://docs.docker.com/get-started/workshop/08_using_compose/](https://docs.docker.com/get-started/workshop/08_using_compose/).

Get yourself familiar with docker compose.

Translate the task 01, 02, 03 into own compose files.

Which questions do you have?