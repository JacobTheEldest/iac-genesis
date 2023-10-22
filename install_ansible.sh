sudo apt update
sudo apt install -y python3 python3-pip sshpass ansible-lint

# Install ansible (recommended method https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
python3 -m pip install --user ansible
ansible --version && \
    echo "Ensure you add the ansible bin location to the path. Add the following line to the .bashrc for example:"; \
    echo 'export PATH=$PATH:$HOME/.local/bin'

# Install jmespath for ansible json commands
python3 -m pip install --user jmespath

# Install netaddr for https://github.com/techno-tim/k3s-ansible
python3 -m pip install --user netaddr

# Enable ansible command autocomplete
python3 -m pip install --user argcomplete
activate-global-python-argcomplete --user

echo "Adding ansible autocomplete to the .bashrc:"; \
grep -qxF 'activate-global-python-argcomplete --user' ~/.bashrc || echo 'activate-global-python-argcomplete --user' >> ~/.bashrc
