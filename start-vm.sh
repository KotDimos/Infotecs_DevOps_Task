#!/usr/bin/env bash

# vagrant box add debian/bullseye64 https://app.vagrantup.com/debian/boxes/bullseye64/versions/11.20220912.1/providers/virtualbox.box
vagrant up 
vboxmanage controlvm debian_infotecs natpf1 "guestssh,tcp,127.0.0.4,43022,10.0.2.15,22"
