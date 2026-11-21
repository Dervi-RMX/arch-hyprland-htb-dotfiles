#!/usr/bin/env bash
target_file="$HOME/.cache/htb-target"
if [ -s "$target_file" ]; then
    echo "󰓾 $(cat "$target_file")"
else
    echo "󰓾 No Target"
fi
