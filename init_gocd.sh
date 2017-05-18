#!/usr/bin/env bash

rm -rf go
docker-compose up -d
docker-compose scale agent=3

until docker exec -it gocd-server cat /etc/go/cruise-config.xml 2>/dev/null 1>/dev/null
do
	echo 'waiting gocd server generate config file.'
	sleep 2
done

sed '/<server/r ./pipelines.xml' ./go/cruise-config.xml > tmp
mv tmp ./go/cruise-config.xml