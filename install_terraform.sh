#!/bin/bash

# https://developer.hashicorp.com/terraform/downloads

sudo apt update
sudo apt install -y gnupg software-properties-common

# Install the HashiCorp GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Verify the key's fingerprint
gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

# Add the official HashiCorp repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

# Install Terraform
sudo apt update
sudo apt install -y terraform

# Install Terraform autocomplete
touch ~/.bashrc
terraform -install-autocomplete
echo -e "\nRestart shell for terraform autocomplete to take effect.\n"

# Finish up and display the version
terraform --version && echo -e "\nInstall successful"
