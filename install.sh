#!/bin/bash 

set -ex

mkdir -p build
cd build

curl https://get.pharo.org/61+vm | bash

./pharo Pharo.image eval "

EpMonitor current disable.

Metacello new 
	baseline: 'ChatServer';
	repository: 'filetree://../';
	load.

EpMonitor current enable.

Deprecation showWarning: false.
Deprecation raiseWarning: false.

Smalltalk saveAs:'chatServer'.
"

printf "\231\002\320\003" > displaySize.bin
dd if="displaySize.bin" of="chatServer.image" bs=1 seek=24 count=4 conv=notrunc
