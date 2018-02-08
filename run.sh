#!/bin/bash 

set -ex

cd build

./pharo-ui chatServer.image eval "GTPlayground openContents: '../playground.st' asFileReference contents."

