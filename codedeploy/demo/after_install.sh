#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
parentdir="$(dirname "$DIR")"
mkdir -p /home/ubuntu/testcodedeploy/demo
sudo chown -R ubuntu:ubuntu testcodedeploy
demopid=$(pgrep -f demo-0.0.1-SNAPSHOT.jar)
kill -9 $demopid
rm -rf /home/ubuntu/testcodedeploy/demo/revision.txt
cp $parentdir/target/demo-0.0.1-SNAPSHOT.jar /tmp/demo-0.0.1-SNAPSHOT.jar
java -jar /tmp/demo-0.0.1-SNAPSHOT.jar > /tmp/logs.txt  2>&1 &
