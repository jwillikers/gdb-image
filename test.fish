#!/usr/bin/env fish

set -l options (fish_opt --short h --long help)
set -a options (fish_opt --short n --long name --required-val)

argparse --max-args 0 $options -- $argv
or exit

if set -q _flag_help
    echo "test.fish [-h|--help] [-n|--name]"
    exit 0
end

set -l name gdb
if set -q _flag_name
    set name $_flag_name
end

podman run --rm --name test-container -it localhost/$name:latest gdb --version
or exit
