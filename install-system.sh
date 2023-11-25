#!/bin/bash -ex

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

cp system/borg-backup@.service system/borg-backup@.timer /etc/systemd/system/

systemctl daemon-reload

for target in "$@"
do
    cp system/$target.patterns /etc/borg/
    systemctl enable borg-backup@"${target}".timer
    systemctl start borg-backup@"${target}".timer
done
