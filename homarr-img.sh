#!/bin/bash

mkdir -p img-homarr
cp -r ./* img-homarr
rm -rf ./img-homarr/img-homarr

ssh cedev@192.168.1.124 "docker exec 4fad5d4267aa sh -c 'rm -rf /var/www/html/*'"

scp -r img-homarr cedev@192.168.1.124:/home/cedev/
ssh cedev@192.168.1.124 "docker cp /home/cedev/img-homarr/. 4fad5d4267aa:/app/public/imgs/"
ssh cedev@192.168.1.124 "rm -rf /home/cedev/img-homarr"
rm -rf img-homarr
