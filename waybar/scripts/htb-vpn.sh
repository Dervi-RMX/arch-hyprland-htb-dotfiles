#!/usr/bin/env bash
IP=$(ip -4 addr show tun0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
if [ -n "$IP" ]; then
  echo "{\"text\": \"󰆧 $IP\", \"tooltip\": \"VPN HTB Conectada (Clic para copiar)\", \"class\": \"connected\"}"
else
  echo "{\"text\": \"󰆧 No VPN\", \"tooltip\": \"tun0 desconectada\", \"class\": \"disconnected\"}"
fi
