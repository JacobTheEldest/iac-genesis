#!/bin/bash

REPO_DIR=$(dirname "$0")

# cd $REPO_DIR
gpg --decrypt $REPO_DIR/sensitive.tar.gpg > $REPO_DIR/sensitive.tar

tar -C $REPO_DIR -xvf $REPO_DIR/sensitive.tar

rm $REPO_DIR/sensitive.tar
