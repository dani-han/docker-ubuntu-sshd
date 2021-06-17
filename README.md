# docker-ubuntu-sshd

Dockerized SSH Daemon (sshd) top on the official Ubuntu images.


## Installed packages

Base:
* ubuntu:latest

Image Specific:
* openssh-server

Configs:
* exposed port 22
* default command: `/run-sshd.sh` (`sshd.run.sh`: copy the public key of the user who created the container.)
* You must use `~/.ssh/id_rsa` for making connection to `root@localhost:22`
* user home (`/home/$USER`) attached to `/host/home/$USER`

## Usage

* Build and Start Ubuntu
```sh
docker-compose up -d
```

* How to restart sshd
```sh
docker container (start|restart|stop) ubuntu_sshd
```

* Attach shell
```sh
docker exec -it ubuntu_sshd_1 bash
```
