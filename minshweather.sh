#!/bin/bash

#<span class="temp-i">+20&deg;</span></div>

site="https://pogoda.tut.by/city/minsk/"
page="index.html"

wget $site > NULL

echo -n "Temperature in Minsk now is "

cat $page | grep temp-i | head -1 | cut -c22-24 

rm $page