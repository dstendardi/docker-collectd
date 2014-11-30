# Docker collectd 

[![Circle CI](https://circleci.com/gh/dstendardi/docker-collectd.svg?style=shield)](https://circleci.com/gh/dstendardi/docker-collectd)

A collectd docker image that configure itself using the docker api and gather metrics about cgroups and linked containers.

## Usage

You need to run this image with two volumes :

 * docker socket : for querying api
 * groups : for gathering metrics about other containers

Also, the collectd will attempt to connect to a carbon compatible host using the following environment variables.

 * `CARBON_PORT_2003_TCP_ADDR`
 * `CARBON_PORT_2003_TCP_PORT` 

```sh
docker run -v /mount/run:/var/run -v /sys/fs/cgroup:/mount/cgroup --link graphite:carbon -ti qay.io/dstendardi/collectd
```

## Roadmap

Add automatic collection of different metrics using detection of environment variables.

 * mysql
 * apache
 * ...

