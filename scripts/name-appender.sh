#!/bin/bash
#pwd
#echo $0
#Secho $1
file='manifest' 
#echo "printing $file.json"

version=`cat data/$file.json | jq .version | sed "s|\"||g"`-$1

echo "the version is $version"

rm -f /tmp/$file.json /tmp/$file-tmp.json
cp data/$file.json /tmp


cat /tmp/$file.json |jq --arg version "$version" '.version=$version' > /tmp/$file-tmp.json
cp /tmp/$file-tmp.json generated/manifest-$1.json
rm -f /tmp/$file-tmp.json /tmp/$file.json

exit 0


# check $1, if empty, ask user to pass arg & then eit 1
#if no pass then no eecute
#check if manifest.json eists in data print, else print "not available" eit 2
