#!/usr/bin/env bash

currentDirectory=$PWD
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

cd ./templates
packer build -var-file=../ubuntu-xsshunter-aws.env ubuntu-xsshunter-aws.json

cd $currentDirectory