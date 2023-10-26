#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

tar -C $SCRIPT_DIR -cvf $SCRIPT_DIR/sensitive.tar sensitive/ ansible/vault_password
gpg --yes --symmetric --no-symkey-cache --cipher-algo AES256 $SCRIPT_DIR/sensitive.tar
rm $SCRIPT_DIR/sensitive.tar
