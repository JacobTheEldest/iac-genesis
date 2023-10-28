# Setup an iac-genesis 

## Use the `initial_setup.sh` script to setup a user and pull this repository
```
wget -q -O - https://raw.githubusercontent.com/JacobTheEldest/iac-genesis/master/initial_setup.sh | bash
```

## decrypt the necessary files with `decrypt.sh`
```
./decrypt.sh
```

## Place the ssh files with the appropriate script in the `sensitive` directory
```
./sensitive/place_ssh_files.sh
```

## Install ansible and install the requirements
```
./install_ansible.sh
ansible-galaxy install -r ansible/requirements.yaml
```

## Run the ansible playbook to setup iac-genesis
Booleans work best passed in json format like the below example

Set `restore` to true to restore from the most recent backup

Set `backup` to true to enable backups for this host

```
ansible-playbook ansible/iac-genesis.yml -i ansible/inventory/iac-genesis -e \
    "{restore: true, backup: false}" \
    -e "@ansible/secrets.yml" \
    --vault-password-file ansible/vault_password
```

## Edit the secrets if necessary
```
ansible-vault edit --vault-password-file ansible/vault_password ansible/secrets.yml
```
