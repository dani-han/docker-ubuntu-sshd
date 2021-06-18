ARG TAG=21.10
FROM ubuntu:${TAG}

RUN apt update && apt install -y openssh-server
RUN mkdir -p /run/sshd

COPY ./sshd.run.sh /run-sshd.sh
RUN chmod +x /run-sshd.sh

CMD /run-sshd.sh
