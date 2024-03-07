#!/bin/bash

echo "Example -> ./homarr_img.sh cedev@10.10.1.0 4fad5d4267aa /home/cedev/"

mkdir -p img-homarr
cp -r ./* img-homarr
rm -rf ./img-homarr/img-homarr

# $1 -> SSH connection string (user@10.10.1.0)
# $2 -> Docker container ID (4fad5d4267aa)
# $3 -> File path on the remote server (/home/user/)

scp -r img-homarr $1:$3
ssh $1 "docker cp $3/img-homarr/. $2:/app/public/imgs/"
ssh $1 "rm -rf $3/img-homarr"
rm -rf img-homarr
