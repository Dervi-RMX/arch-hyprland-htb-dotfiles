settarget() {
  if [ -z "$1" ]; then
    echo "Uso: settarget <IP> [Nombre]"
    return 1
  fi
  mkdir -p ~/.cache
  if [ -n "$2" ]; then
    echo "$1 - $2" > ~/.cache/htb_target
  else
    echo "$1" > ~/.cache/htb_target
  fi
  pkill -RTMIN+8 waybar 2>/dev/null
  echo "[+] Target fijado: $(cat ~/.cache/htb_target)"
}

cleartarget() {
  rm -f ~/.cache/htb_target
  pkill -RTMIN+8 waybar 2>/dev/null
  echo "[-] Target limpiado"
}
