# Atala Prism local setup using AWS

Create an AWS EC2 Ubuntu 20.04 instance with 2 CPUs, 8 GB Mem, 30 GB Disk
Log into aws instance
```
ssh -i your-pem-file.pem ubuntu@aws-instance-dns-name
sudo apt update
sudo apt -y upgrade
sudo reboot
```
Log back into your AWS instance
```
ssh -i your-pem-file.pem ubuntu@aws-instance-dns-name
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt -y install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
newgrp docker 
docker run hello-world
git clone https://github.com/hyperledger-labs/open-enterprise-agent.git
cd open-enterprise-agent/infrastructure/local
git checkout prism-agent-v1.28.0
echo "PRISM_AGENT_VERSION=1.28.0
PRISM_NODE_VERSION=2.2.1
PORT=8080
VAULT_DEV_ROOT_TOKEN_ID=root
PG_PORT=5432 " > .env-issuer

echo "PRISM_AGENT_VERSION=1.28.0
PRISM_NODE_VERSION=2.2.1
PORT=8090
VAULT_DEV_ROOT_TOKEN_ID=root
PG_PORT=5433 " > .env-holder
```
Open another terminal window and log into AWS instance with port forwarding
```
ssh -i your-pem-file.pem -L 8080:aws-instance-dns-name:8080 ubuntu@aws-instance-dns-name
cd open-enterprise-agent/infrastructure/local
cp .env-issuer .env
./run.sh -e .env-issuer -d host.docker.internal -n issuer -p 8080
```
Open another terminal window and log into AWS instance
```
ssh -i your-pem-file.pem -L 8090:aws-instance-dns-name:8090 ubuntu@aws-instance-dns-name
cd open-enterprise-agent/infrastructure/local
cp .env-holder .env
./run.sh -e .env-holder -d host.docker.internal -n holder -p 8090
```

Access the issuer prism agent by going to http://localhost:8080/docs/prism-agent/api/

Access the holder prism agent by going to http://localhost:8090/docs/prism-agent/api/

