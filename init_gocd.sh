#!/usr/bin/env bash
docker-compose down
rm -rf go
docker-compose up -d
#docker exec -it gocd-server chown go:go /etc/go
docker-compose scale agent=3
until cat go/cruise-config.xml 2>/dev/null 1>/dev/null
do
	echo 'waiting gocd server generate config file.'
	sleep 2
done

sed '/<server/r ./pipelines.xml' ./go/cruise-config.xml > tmp
mv tmp ./go/cruise-config.xml