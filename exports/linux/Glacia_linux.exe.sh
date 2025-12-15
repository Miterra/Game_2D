#!/bin/sh
printf '\033c\033]0;%s\a' T3
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Glacia_linux.exe.x86_64" "$@"
