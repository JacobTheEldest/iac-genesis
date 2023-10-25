#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

SSHPUBKEYS=$(
  cat <<-'EOT'
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkM0Nd2wBCQ3EiSc63CjxTWq5jA2ISFF9IMyQ7c0P86usmR+o2ns8nED8Or9DLeVYUzkCltaM5rpp0L4+4HM2gGalYl3No+pWFdwBwEbXNJg6RN/tzdxlU8rIO3t+gpLS+mA5+dSWk0SwnSuBervX1IcUw8wa+fAHso4MDfUVJxLOTJd9IWzd/l9KeKIwLycd7Eu6WRJunbyviPvOqOVgktGkCbLDid6Y/xntFCO986jrs5sEosHw5lkahURLBhPhpc9FiCnDRP+rNGh3+61BXfcB4UaGQiW0vOFLmX98vTtzl1hva9hVS0AJJ4LTJ4xgQeMKArYpbx6t5gHIp6Koj root@Jacob-Device
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDixQKhoRKZfuUteMZ5ykNLy9uymvo71uQ1LZUbaC0Xm/HppWjiWgZcjcUuA6Fnw1dMf6byMHtIV73fMLEOrVUn4WrMTWDyKmCZotNEs5LcurlBQaLZ3myLczzYa/4jTkgM6a5NA2n1QoMmN+8io9f80DWovjSf5tm8tEAAl8FnV6H5JtcXgM9X7iyg6t4mZxbi1s5ROGaNtZSQSstH2yABeX38IUZcC21+5zvHwmdx4jlDrFTs9zMS9dwruWHgQ8QItHoreJktaAE+5UFkRpVqi2dAWRSyYixV/10C2TzCFvhy/8u79XQGNAfk43SwDh4VDmoRg7sxoTZePjnhwLctjsMtH4jk5qcl1tMUSGGkjO0UIr4ZxH+aoT+ssGEBDtuzrVHaN273YAJ7h2inDmZVsfdep14NQ0/NreOFEzZb7h/zjmSTidWrE1H0E5nex0U9CB8cfCWuBmXYBsIL4YsWxaP/H3c+z364lK/TV8YSOqYxWhAdSBNN8DFLhKZqZBM= root@iac-genesis
EOT
)
USER="jacob"

echo
echo "Installing necessary tools"
sudo apt update
sudo apt install -y git gpg tar

echo
echo "Creating user"
useradd --create-home --shell /bin/bash $USER
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/10-setup
mkdir -p /home/$USER/.ssh/ /home/$USER/code
echo "$SSHPUBKEYS" > /home/$USER/.ssh/authorized_keys

echo
echo "Pulling full repo"
git clone  https://github.com/JacobTheEldest/iac-genesis /home/$USER/code/iac-genesis

chown -R $USER:$USER /home/$USER/
