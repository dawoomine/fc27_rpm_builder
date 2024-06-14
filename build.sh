#!/bin/bash -x
. env

running_container=`docker ps | grep $image_name | cut -d ' ' -f 1`
if [[ x"$running_container" != x""  ]]; then
  docker stop $running_container
fi

stopped_containers=`docker ps -a | grep $image_name | cut -d ' ' -f 1`
if [[ x"$stopped_containers" != x"" ]]; then
  docker container rm $stopped_containers
fi

docker build -t $image_name .
