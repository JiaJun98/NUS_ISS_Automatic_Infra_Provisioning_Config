#### Pre-installation

### Installing Terraform

ssh-keygen

cat ~/.ssh/id_rsa.pub

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform

terraform --version


### Steps for Day 1

1. add the providers in provider.tf

2. define the relevant variables in variables.tf

3. add the in necessary nginx.conf.tftpl.

4. define the required resources in resources.tf

5. execute terraform init to initialize and download the necessary providers specified in provider.tf.

6. ensure your have the necessary DO_TOKEN defined as global environment variable.
```
nano ~/.bashrc
export DO_TOKEN=<DO TOKEN> #This is the Personal Access Token
source ~/.bashrc
```

7. Perform a terraform plan.
```
terraform plan -var "do_token=${DO_TOKEN}" -var "ssh_private_key=/root/.ssh/id_rsa" -var "docker_host=<docker host ip>" -var "docker_cert_path=/root/.docker/machine/machines/docker-nginx"
```

8. Once the provision plan is done without error, apply and provision the infrastructure.
```
terraform apply -auto-approve -var "do_token=${DO_TOKEN}" -var "ssh_private_key=/root/.ssh/id_rsa" -var "docker_host=<docker host ip>" -var "docker_cert_path=/root/.docker/machine/machines/docker-nginx"
```

9. To verifiy, go to browser and access the provision nginx address as follows:
```
http://<nginx_ip>:80/
```

10. If you manage to see the boardgame app and perform the necessary CRUD operations, you have successfully completed workshop 01.

11. To tear down the environment, perform the following destroy operation.
```
terraform destroy -var "do_token=${DO_TOKEN}" -var "ssh_private_key=/root/.ssh/id_rsa" -var "docker_host=<docker host ip>" -var "docker_cert_path=/root/.docker/machine/machines/docker-nginx"
```

#### Day 2

#### Follow the guide here
https://github.com/kenken64/NUSISS-DevOpsEng/blob/master/workshop/workshop3-1.md

terraform plan -var "do_token=${DO_PAT}" -var "ssh_private_key=/root/.ssh/id_rsa" -var "codeserver_password=password123456"

terraform apply -auto-approve -var "do_token=${DO_PAT}" -var "ssh_private_key=/root/.ssh/id_rsa" -var "codeserver_password=password123456"

ansible-playbook playbook.yml -i inventory.yaml

#### Day 3

Make sure control server and images is ubuntu 20.04

```
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible-core
```

## Install packer on ubuntu 20.04 x86

```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

````
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
````

```
sudo apt-get update && sudo apt-get install packer
```

## Initialize packer project

```
packer init config.pkr.hcl
```

## Build the packer golden image
```
packer build --var do_token=${DO_PAT} .
```

## Terraform provisioning

```
terraform init
```

```
terraform plan -var "do_token=${DO_PAT}" -var "ssh_private_key=/root/.ssh/id_rsa" -var "cs_password=password123456" -var "cs_domain=test"
```

```
terraform apply --auto-approve-var "do_token=${DO_PAT}" -var "ssh_private_key=/root/.ssh/id_rsa" -var "cs_passwword=password123456" -var "cs_domain=test"
```
