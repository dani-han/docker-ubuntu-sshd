# docker-ubuntu-sshd

Dockerized SSH Daemon (sshd) top on the official Ubuntu images.


## Installed packages

Base Image:
* ubuntu[:tag]

Image specific packages to be installed:
* openssh-server

Build (`docker build`) configs:
* default command: `/run-sshd.sh`

Test run (`docker run -d`) configs:
* exposed port
    * `-p 22:22`
* environment `-e`
    * `HOSTHOME=/home/$USER`
* volume `-v`
    * `/home/$USER:/host/home/$USER`

## Test run
What is done in run command under the above test run configs:
* `/run-sshd.sh` will be run
    * copy the public key from `/host/HOME/USER/.ssh/id_rsa.pub` to `/root/.ssh/authorized_keys`.
* from host terminal run:
    * `ssh root@localhost`
    * ssh session will open with your private key `~/.ssh/id_rsa`

## Usage

* Build and Run Ubuntu
```sh
docker-compose up -d
```

* Build
```sh
docker build -t ubuntu_sshd .
```

* Build (with Ubuntu:tag)
```sh
tag=latest; docker build -t ubuntu_sshd:$tag --build-arg TAG=$tag .
```

* Run
```sh
docker run --name ubuntu_1 -d -p 22:22 -e "HOSTHOME=$HOME" -v "$HOME:/host/$HOME" ubuntu_sshd
```

* Manage container
```sh
# Start|restart|stop container
docker container (start|restart|stop) ubuntu_1

# Attach shell (on started container)
docker exec -it ubuntu_1 bash

# View logs
docker logs -ft ubuntu_1
```
