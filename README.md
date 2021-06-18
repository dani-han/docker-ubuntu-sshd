# docker-ubuntu-sshd

Dockerized SSH Daemon (sshd) top on the official Ubuntu images.


## Installed packages

Base:
* ubuntu[:tag]

Image Specific:
* openssh-server

Configs:
* exposed port 22
* default command: `/run-sshd.sh` (`sshd.run.sh`: copy the public key of the user who created the container.)
* You must use `~/.ssh/id_rsa` for making connection to `root@localhost:22`
* user home (`/home/$USER`) attached to `/host/home/$USER`

## Usage

* Build and Run Ubuntu
```sh
docker-compose up -d --build
```

* Build
```sh
docker build -t ubuntu_sshd -f sshd.dockerfile .
```

* Build (with Ubuntu:tag)
```sh
tag=latest; docker build -t ubuntu_sshd:$tag --build-arg TAG=$tag -f sshd.dockerfile .
```

* Run
```sh
docker run --name ubuntu_sshd -d -p 22:22 -e "HOSTHOME=$HOME" -v "$HOME/:/host/$HOME" ubuntu_sshd
```

* How to restart sshd
```sh
docker container (start|restart|stop) ubuntu_sshd
```

* Attach shell
```sh
docker exec -it ubuntu_sshd bash
```
