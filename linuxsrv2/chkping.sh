#!/bin/bash

function set_sleep_time {
    min=1
    max=10
    number=$(expr $min + $RANDOM % $max)
    echo $number
}

while true
do
    set_sleep_time
    sleep $number
    curl http://pingapp:5000/ping
done
