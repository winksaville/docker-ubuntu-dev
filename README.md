# Dockerfile for creating ubuntu dev image with python, nodejs, cmake and ninja

## Pull image
```
wink@3900x:~/prgs/docker/ubuntu-dev (master)
$ time docker pull winksaville/ubuntu-dev:20.04
20.04: Pulling from winksaville/ubuntu-dev
6a5697faee43: Pull complete 
ba13d3bc422b: Pull complete 
a254829d9e55: Pull complete 
318b7765b1ab: Pull complete 
0d978e6235a4: Pull complete 
Digest: sha256:6b7c6a6cdd9bdc553839b35a92fab44ad937aded92373a057d5d5987f128327d
Status: Downloaded newer image for winksaville/ubuntu-dev:20.04
docker.io/winksaville/ubuntu-dev:20.04

real	0m19.110s
user	0m0.045s
sys	0m0.029s

wink@3900x:~/prgs/docker/ubuntu-dev (master)
$ docker images
REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
winksaville/ubuntu-dev   20.04               824bcddd044c        5 hours ago         796MB
```
## Build

This is a rebuild, the output is MUCh longer if nothing was cached
```
wink@3900x:~/prgs/docker/ubuntu-dev (master)
$ docker build -t winksaville/ubuntu-dev:20.04 .
Sending build context to Docker daemon  47.62kB
Step 1/9 : FROM ubuntu:20.04
 ---> d70eaf7277ea
Step 2/9 : LABEL Description="A Linux image suitable"
 ---> Using cache
 ---> b848476a7dd7
Step 3/9 : LABEL Author="Wink Saville"
 ---> Using cache
 ---> 4862eb85904f
Step 4/9 : LABEL Email="wink@saville.com"
 ---> Using cache
 ---> fae1c56d4f1c
Step 5/9 : ARG DEBIAN_FRONTEND=noninteractive
 ---> Using cache
 ---> b17bbf29102c
Step 6/9 : RUN apt-get update &&    apt-get install -y --no-install-recommends         build-essential         autoconf         automake         libtool         pkg-config         apt-transport-https         ca-certificates         software-properties-common         wget         git         curl         gnupg         zlib1g-dev         swig         locales         vim         gdb         valgrind 	python3-setuptools         cmake         ninja-build         nodejs         npm
 ---> Using cache
 ---> 91a2324566da
Step 7/9 : RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
 ---> Using cache
 ---> 5e6a7f8a0df8
Step 8/9 : ENV LANG en_US,UTF-8
 ---> Using cache
 ---> 016106bd8d79
Step 9/9 : ENV LANGUAGE en_US,UTF8
 ---> Using cache
 ---> 824bcddd044c
Successfully built 824bcddd044c
Successfully tagged winksaville/ubuntu-dev:20.04
```

## Pushed using
```
wink@3900x:~/prgs/docker/ubuntu-dev (master)
$ docker push winksaville/ubuntu-dev:20.04
The push refers to repository [docker.io/winksaville/ubuntu-dev]
7ecc14b375a7: Pushed 
959f812ec5e9: Pushed 
cc9d18e90faa: Mounted from library/ubuntu 
0c2689e3f920: Mounted from library/ubuntu 
47dde53750b4: Mounted from library/ubuntu 
20.04: digest: sha256:6b7c6a6cdd9bdc553839b35a92fab44ad937aded92373a057d5d5987f128327d size: 1366
```
