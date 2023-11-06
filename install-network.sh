#!/bin/bash -ex

# REQUIRES SUDO
# Installs and enables services that manage backups based on network amd sleep status

sudo cp sleep@.service /etc/systemd/system/
sudo systemctl enable sleep@$(whoami).service

cp \
    backup-ready-network.service \
    backup-ready-network-sleep.service \
    ~/.config/systemd/user/

systemctl --user daemon-reload
systemctl --user enable backup-ready-network.service backup-ready-network-sleep.service
systemctl --user start backup-ready-network.service --no-block # Blocks until a network is ready for backups
