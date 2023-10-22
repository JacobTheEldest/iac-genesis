#!/bin/bash

SCRIPT_DIR=$(dirname "$0")


sudo apt update
sudo apt install -y git gpg tar


git clone --depth=1 https://github.com/JacobTheEldest/iac-master
