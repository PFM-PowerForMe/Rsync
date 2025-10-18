
use std *
def main [] {
    let sy = (echo $env.HELLO) | complete
    $sy.stdout
}