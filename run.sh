#!/bin/bash
. env
docker run -dp 127.0.0.1:222:22 --name $image_name $image_name
