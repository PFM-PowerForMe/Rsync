#!/usr/bin/env nu

def "main client" [] {
    /etc/periodic/daily/rsync init
    rc-service crond start
}

def main [] {
    rsync \
        --daemon \
        --bwlimit=128 \
        --no-detach
}