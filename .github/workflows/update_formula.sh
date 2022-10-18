#!/bin/bash

set -euxo pipefail

while getopts u:v:s:f: flag
do
    case "${flag}" in
        u) url=${OPTARG};;
        v) version=${OPTARG};;
        s) sha=${OPTARG};;
        f) file=${OPTARG};;
    esac
done

sed -i "s/ url \".*\"/ url \"$url\"/g" $file
sed -i "s/ version \".*\"/ version \"$version\"/g" $file
sed -i "s/ sha256 \".*\"/ sha256 \"$sha\"/g" $file
