#!/bin/sh

sudo apt install g++ libgmp3-dev cmake libblkid-dev e2fslibs-dev libboost-all-dev libaudit-dev
sudo cp /usr/bin/python3 /usr/bin/python


cd ~ || exit
git clone https://github.com/grigoryfedyukovich/aeval.git
cd aeval || exit
# have to switch to rnd branch, that's where freqhorn is defined
git switch rnd
mkdir build; cd build || exit; cmake ../; make; make;
