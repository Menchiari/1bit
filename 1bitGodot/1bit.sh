#!/bin/sh
echo -ne '\033c\033]0;1bit\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/1bit.x86_64" "$@"
