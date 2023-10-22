#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

gpg --decrypt $SCRIPT_DIR/sensitive.tar.gpg > $SCRIPT_DIR/sensitive.tar
tar -C $SCRIPT_DIR -xvf $SCRIPT_DIR/sensitive.tar
rm $SCRIPT_DIR/sensitive.tar

gpg --decrypt $SCRIPT_DIR/ansible.tar.gpg > $SCRIPT_DIR/ansible.tar
tar -C $SCRIPT_DIR -xvf $SCRIPT_DIR/ansible.tar
rm $SCRIPT_DIR/ansible.tar
