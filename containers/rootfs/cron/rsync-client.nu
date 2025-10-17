#!/usr/bin/env nu

use std *

def run [max_retries: int] {
    let sy = (rsync --quiet --password-file=/etc/rsyncd.secrets --checksum --archive --recursive --delete --force --compress --bwlimit=128 container-user@$env.SERVER::rsyncd /data) | complete

    mut retries = 0
    mut sleep_time = 15sec
    while $retries < $max_retries { 
        if $sy.exit_code == 0 {
            break
            log info $sy.stdout
        };
        log error $sy.stderr
        log warning $"($retries)/16 Retrying after ($sleep_time) ..."
        sleep $sleep_time
        $retries = $retries + 1
        $sleep_time = $sleep_time + 15sec
    };
}

def "main init" [] {
    run 99999
    rc-service crond start
}

def main [] {
    run 8
}