#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

tar -C $SCRIPT_DIR -cvf $SCRIPT_DIR/sensitive.tar sensitive/ $SCRIPT_DIR/ansible/vault_password $SCRIPT_DIR/fix_git.sh
gpg --yes --symmetric --no-symkey-cache --cipher-algo AES256 $SCRIPT_DIR/sensitive.tar
rm $SCRIPT_DIR/sensitive.tar
