#!/bin/bash

#<span class="temp-i">+20&deg;</span></div>

site="https://pogoda.tut.by/city/minsk/"
page="index.html"
period_settings_file="config.ini"


if [ -e $period_settings_file ]
then
    period=`cat $period_settings_file`
else
    echo "File config.ini isn't found!"
    period=1
fi

echo "Period is $period seconds"

echo -n "Temperature in Minsk now is "
while [ 1 ]
do
    wget $site &> /dev/null
    temperature=`cat $page | grep temp-i | head -1 | cut -c22-24`
    rm $page
    echo -n $temperature
    sleep $period
    echo -n $'\b\b\b'
done