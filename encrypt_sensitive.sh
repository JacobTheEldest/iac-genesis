#!/bin/bash

REPO_DIR=$(dirname "$0")

tar -C $REPO_DIR -cvf $REPO_DIR/sensitive.tar sensitive/
gpg --yes --symmetric --no-symkey-cache --cipher-algo AES256 $REPO_DIR/sensitive.tar

rm $REPO_DIR/sensitive.tar
