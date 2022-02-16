#!/bin/bash
git clone $1 ./repo

cd repo

tar -czf ../repo.tar.gz .

curl -XPOST --unix-socket /var/run/docker.sock -H 'Content-Type: application/json' http://localhost/build?t=$3/$2 --data-binary @repo.tar.gz


LOGIN=`echo "{ \"username\": \"$3\", \"password\": \"$4\"}" | base64 --wrap=0`
curl -XPOST --unix-socket /var/run/docker.sock -H "X-Registry-Auth: $LOGIN" http://localhost/images/$3/$2/push
