#!/bin/bash

#<span class="temp-i">+20&deg;</span></div>

site="https://pogoda.tut.by/city/minsk/"
page="index.html"

echo -n "Temperature in Minsk now is "
while [ 1 ]
do
    wget $site &> /dev/null
    temperature=`cat $page | grep temp-i | head -1 | cut -c22-24`
    rm $page
    echo -n $temperature
    sleep 2
    echo -n $'\b'
    echo -n $'\b'
    echo -n $'\b'
done