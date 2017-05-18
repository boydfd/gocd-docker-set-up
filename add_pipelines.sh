#!/usr/bin/env bash
sed '/<server/r ./pipelines.xml' ./go/cruise-config.xml > tmp
mv tmp ./go/cruise-config.xml