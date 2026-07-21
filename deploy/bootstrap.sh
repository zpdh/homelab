#!/bin/bash

set -e

echo "Bootstrapping..."

SERVICE_FILE="/etc/systemd/system/homelab-deploy.service"

sudo tee "$SERVICE_FILE" > /dev/null <<EOF
[Unit]
Description=Deploy Homelab Services
After=network-online.target
Wants=network-online.target

[Service]
Type=oneshot
User=$USER
ExecStart=$HOME/scripts/deploy.sh

[Install]
WantedBy=multi-user.target
EOF

echo "Reloading System Daemon & enabling deployments"
sudo systemctl daemon-reload
sudo systemctl enable homelab-deploy.service

echo "Bootstrap Complete!"
