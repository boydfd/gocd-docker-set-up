#!/usr/bin/env bash

host=$1
echo "HOST $host
	StrictHostKeyChecking no
	UserKnownHostsFile=/dev/null
" >> ./gocd-agent/config

chmod 600 ./gocd-agent/config

