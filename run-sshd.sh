#!/bin/sh

HOST_PUB_KEY=/host/$HOSTHOME/.ssh/id_rsa.pub
AUTHORIZED_KEYS=~/.ssh/authorized_keys

mkdir -p $(dirname $AUTHORIZED_KEYS)
echo "Copy: $HOST_PUB_KEY => $AUTHORIZED_KEYS"
cp $HOST_PUB_KEY $AUTHORIZED_KEYS
chmod 600 $AUTHORIZED_KEYS

/usr/sbin/sshd -De
