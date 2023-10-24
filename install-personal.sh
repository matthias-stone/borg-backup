#!/bin/bash -x

HOST=${1:-$HOSTNAME}

[ -n "$HOST" ] || exit 1

ln -s ./personal.env.d ~/.config/borg/envs
cp backup-ready-network.service borg-backup@.service ~/.config/systemd/user/
cp borg-backup@.timer.personal.$HOST ~/.config/systemd/user/borg-backup@.timer
systemctl --user daemon-reload
systemctl --user enable backup-ready-network.service
systemctl --user start backup-ready-network.service

for TARGET in $(ls ./personal.env.d/ | grep 'env$' | sed 's/.env$//' )
do
    systemctl --user enable borg-backup@$TARGET.timer
    systemctl --user enable borg-backup@$TARGET.service
    systemctl --user start borg-backup@$TARGET.timer
done
