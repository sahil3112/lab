#!/bin/bash
apt-get update
apt-get install unzip -y
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
wget https://github.com/deepfence/ThreatMapper/archive/refs/tags/threatintel-yara-2024-02-12_01-26-18.zip
unzip threatintel-yara-2024-02-12_01-26-18.zip
cd /home/ubuntu/ThreatMapper-threatintel-yara-2024-02-12_01-26-18/deployment-scripts
docker compose up -d
sleep 180
