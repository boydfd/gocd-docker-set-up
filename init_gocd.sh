#!/usr/bin/env bash
docker-compose down
rm -rf godata
docker-compose up -d
docker-compose scale agent=3
configFile=godata/config
until cat ${configFile}/cruise-config.xml 2>/dev/null 1>/dev/null
do
	echo 'waiting gocd server generate config file.'
	sleep 2
done

sed '/<server/r ./pipelines.xml' ${configFile}/cruise-config.xml > tmp
mv tmp ${configFile}/cruise-config.xml