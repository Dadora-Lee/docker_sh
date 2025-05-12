#!/bin/bash

set -e

echo "🔧 시스템 패키지 업데이트 및 필수 패키지 설치..."
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "🔐 Docker GPG 키 추가..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "📦 Docker 저장소 추가..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 APT 저장소 갱신..."
sudo apt update

echo "🐳 Docker 엔진 설치..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "🐳 Docker 데몬 실행..."
sudo nohup dockerd > dockerd.log 2>&1 &
