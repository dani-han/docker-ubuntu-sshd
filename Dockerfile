ARG TAG=latest
FROM ubuntu:${TAG}

RUN apt update && apt install -y openssh-server
RUN mkdir -p /run/sshd

COPY run-sshd.sh /
RUN chmod +x /run-sshd.sh

CMD /run-sshd.sh
