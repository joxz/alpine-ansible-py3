[![Build Status](https://travis-ci.org/joxz/alpine-ansible-py3.svg?branch=master)](https://travis-ci.org/joxz/alpine-ansible-py3)

# alpine-ansible-py3

Minimal [Alpine Linux](https://alpinelinux.org/) docker image for running [Ansible](https://www.ansible.com/) using only Python3.

## Build Image

### Build from git repository

```
$ git clone https://github.com/joxz/alpine-ansible-py3.git && cd alpine-ansible-py3

$ make build
```

The image will be tagged with the short hash from the latest git commit, e.g. `jones2748/alpine-ansible-py3:7e4e631`

### Pull from Docker Hub

```
$ docker pull jones2748/alpine-ansible-py3:latest
```

Docker Hub images will be tagged as `jones2748/alpine-ansible-py3:latest` and/or with git tags, e.g. `jones2748/alpine-ansible-py3:v0.2`

## Run container

Run a playbook inside the container:

```
$ docker run -it --rm \
    -v ${PWD}:/ansible \
    jones2748/alpine-ansible-py3 \
    ansible-playbook -i inventory playbook.yml
```

## Sanity checks

`make test` executes both tests listed below

### Builtin test for `ansible --version`

```
$ docker run -it --rm alpine-ansible-py3 version
ansible 2.7.7
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.6/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.6.8 (default, Jan 24 2019, 16:36:30) [GCC 8.2.0]
```

### Builtin test for `ansible -m setup all` (localhost)

```
$ docker run -it --rm alpine-ansible-py3 setup
localhost | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [],
        "ansible_all_ipv6_addresses": [],
        "ansible_apparmor": {
            "status": "disabled"
        },
        "ansible_architecture": "x86_64",
...
```

## Shell access

Shell access as user `ansible`

```
$ docker run -it --rm alpine-ansible-py3
/ansible $ whoami
ansible
```

Shell access as user `root`

```
$ docker run -it --rm alpine-ansible-py3 makemeroot
/ansible # whoami
root
```

## Make

Makefile included for build, run, test, clean,...

```
$ make
build                          build container
build-no-cache                 build container without cache
build-ver                      build specific ansible version: make build-ver ALPINE_VERSION="3.9" ANSIBLE_VERSION="2.7.6"
clean                          remove images
help                           this help
history                        show docker history for container
inspect                        inspect container properties - pretty: 'make inspect | jq .' requires jq
logs                           show docker logs for container (ONLY possible while container is running)
run                            run container
test                           test container with builtin tests
```